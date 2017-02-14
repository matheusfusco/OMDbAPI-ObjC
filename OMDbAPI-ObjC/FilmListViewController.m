//
//  FilmListViewController.m
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import "FilmListViewController.h"

@interface FilmListViewController () {
    RLMResults * filmResults;
    RLMRealm * realm;
    
    NSMutableArray * filteredFilms;
    BOOL isFiltering;
    
    UITapGestureRecognizer * tap;
}

@end

@implementation FilmListViewController
@synthesize filmTableView, filmPoster, searchFilmBar;

#pragma mark - View & Initialization Methods
- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.backBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStyleDone target:nil action:nil];
    
    searchFilmBar.delegate = self;
    isFiltering = false;
}

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];

    realm = [RLMRealm defaultRealm];
    filmResults = [FilmRealm allObjectsInRealm:realm];
    [filmTableView reloadData];
}

#pragma mark - TableView Delegate and DataSource Methods
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (isFiltering) {
        return filteredFilms.count;
    }
    else {
        return filmResults.count;
    }
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSString * cellIdentifier = @"filmCell";
    
    FilmTableViewCell * cell = [filmTableView dequeueReusableCellWithIdentifier:@"filmCell"];
    if (!cell) {
        cell = [[FilmTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    if (isFiltering) {
        [cell setFilm: filteredFilms[indexPath.row]];
    }
    else {
        [cell setFilm: filmResults[indexPath.row]];
    }
    
    return cell;    
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

-(UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return [UIView new];
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.01f;
}

#pragma mark - SearchBar Delegate Methods
-(void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    if (searchText.length == 0) {
        isFiltering = false;
    }
    else {
        isFiltering = true;
        
        filteredFilms = [[NSMutableArray alloc] init];
        
        for (FilmModel * film in filmResults) {
            NSRange filmName = [film.title rangeOfString:searchText options:NSCaseInsensitiveSearch];
            if (filmName.location != NSNotFound) {
                [filteredFilms addObject:film];
            }
        }
    }
    [filmTableView reloadData];
}

-(void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(dismissTheKeyBoard:)];
    [self.view addGestureRecognizer:tap];
}

-(void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [searchBar resignFirstResponder];
}

-(void) dismissTheKeyBoard:(id)sender {
    [searchFilmBar resignFirstResponder];
    [self.view removeGestureRecognizer:tap];
}

#pragma mark - Memory Management
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
