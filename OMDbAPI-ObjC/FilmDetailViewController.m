//
//  FilmDetailViewController.m
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import "FilmDetailViewController.h"


@interface FilmDetailViewController () {
    FilmDetailModel * model;
    MBProgressHUD * hud;
    
    UITapGestureRecognizer * tap;
}

@end

@implementation FilmDetailViewController
@synthesize filmModel, addFilmButton;
#pragma mark - Initialization View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    model = [[FilmDetailModel alloc] init];
    model.delegate = self;
    
    if (filmModel) {
        [_searchFilmTextField setHidden:YES];
        [addFilmButton setHidden:YES];
        self.navigationItem.title = @"Detalhes do filme";
        [self layoutViewWithFilm:filmModel];
    }
}

#pragma mark - Button Actions
- (IBAction)addFilmButtonClicked:(id)sender {
    if (filmModel) {
        [model saveFilmToFavorites:filmModel completion:^(BOOL success) {
            if (success) {
                [self.navigationController popToRootViewControllerAnimated:YES];
            }
            else {
                [self showAlertWithTitle:@"Erro" andMessage:@"Filme já foi adicionado anteriormente!"];
            }
        }];
    }
    else {
        [self showAlertWithTitle:@"Erro" andMessage:@"Primeiro procure um filme, depois adicione aos seus favoritos."];
    }
}

#pragma mark - Custom Delegate Methods
-(void)fetchedFilmInformation:(FilmModel *)film {
    [hud hideAnimated:YES];
    
    if ([film.response boolValue]) {
        [self layoutViewWithFilm: film];
    }
    else {
        [self showAlertWithTitle:@"Erro" andMessage:@"Filme não encontrado!"];
    }
}

-(void)errorWhileFetchingFilmInformation:(NSError *)error {
    [hud hideAnimated:YES];
    [self showAlertWithTitle:@"Erro" andMessage:@"Ocorreu um erro. Tente novamente mais tarde."];
}

#pragma mark - Custom Methods
-(void) showAlertWithTitle:(NSString *)title andMessage:(NSString *) message {
    filmModel = nil;
    
    _searchFilmTextField.text = @"";
    _filmTitleLabel.text = @"-";
    _releasedDateLabel.text = @"-";
    _durationLabel.text = @"-";
    _genreLabel.text = @"-";
    _directorLabel.text = @"-";
    _actorsLabel.text = @"-";
    _plotLabel.text = @"-";
    [_posterImgView setImage:nil];
    
    UIAlertController * alert = [UIAlertController alertControllerWithTitle:title message:message preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * ok = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleCancel handler:nil];
    [alert addAction:ok];
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)layoutViewWithFilm:(FilmModel*)film {
    filmModel = [FilmModel new];
    filmModel = film;
    
    _filmTitleLabel.text = filmModel.title;
    _releasedDateLabel.text = filmModel.releasedDate;
    _durationLabel.text = filmModel.duration;
    _genreLabel.text = filmModel.genre;
    _directorLabel.text = filmModel.director;
    _actorsLabel.text = filmModel.actors;
    _plotLabel.text = filmModel.plot;
    [_posterImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", filmModel.poster]]];
}

#pragma mark - TextField Delegate Methods
-(BOOL)textFieldShouldReturn:(UITextField *)textField {
    if (textField == _searchFilmTextField) {
        [textField resignFirstResponder];
        hud = [MBProgressHUD showHUDAddedTo:self.view animated:YES];
        NSString * string = [textField.text stringByReplacingOccurrencesOfString:@" " withString:@"+"];
        [model fetchFilmInformationBasedOnTitle:string];
    }
    return YES;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissTheKeyBoard:)];
    [self.view addGestureRecognizer:tap];
}

-(void) dismissTheKeyBoard:(id)sender {
    [_searchFilmTextField resignFirstResponder];
    [self.view removeGestureRecognizer:tap];
}

#pragma mark - Memory Management
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
