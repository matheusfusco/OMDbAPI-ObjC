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
    FilmModel * filmModel;
    
    UITapGestureRecognizer * tap;
}

@end

@implementation FilmDetailViewController

#pragma mark - Initialization View Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    model = [[FilmDetailModel alloc] init];
    model.delegate = self;
}

#pragma mark - Button Actions
- (IBAction)addFilmButtonClicked:(id)sender {
    if (filmModel) {
        [model saveFilmToFavorites:filmModel completion:^(BOOL success) {
            if (success) {
                //[self showAlertWithTitle:@"Sucesso" andMessage:@"Filme adicionado com sucesso!"];
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
        filmModel = [FilmModel new];
        filmModel = film;
        
        _filmTitleLabel.text = film.title;
        _releasedDateLabel.text = film.releasedDate;
        _durationLabel.text = film.duration;
        _genreLabel.text = film.genre;
        _directorLabel.text = film.director;
        _actorsLabel.text = film.actors;
        _plotLabel.text = film.plot;
        [_posterImgView sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@", film.poster]]];
    }
    else {
        [self showAlertWithTitle:@"Erro" andMessage:@"Filme não encontrado!"];
    }
}

-(void)errorWhileFetchingFilmInformation:(NSError *)error {
    [hud hideAnimated:YES];
    [self showAlertWithTitle:@"Erro" andMessage:@"Ocorreu um erro. Tente novamente mais tarde."];
}

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
