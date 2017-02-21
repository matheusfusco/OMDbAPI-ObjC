//
//  FilmListViewController.h
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <RLMRealm.h>
#import <RLMResults.h>
#import <iCarousel.h>
#import "FilmRealm.h"
#import "FilmTableViewCell.h"
#import "FilmDetailViewController.h"

@interface FilmListViewController : UIViewController <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate, UISearchBarDelegate, UIGestureRecognizerDelegate, iCarouselDelegate, iCarouselDataSource>

@property (weak, nonatomic) IBOutlet UITableView * filmTableView;
@property (weak, nonatomic) IBOutlet UIImageView * filmPoster;
@property (weak, nonatomic) IBOutlet UISearchBar * searchFilmBar;
@property (weak, nonatomic) IBOutlet iCarousel   * iCarouselView;

@end

/*
 https://cocoapods.org/pods/RJContactDetailsView
 https://cocoapods.org/pods/SIAlertView
 https://cocoapods.org/pods/SCLAlertView-Objective-C
 */
