//
//  FilmDetailViewController.h
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FilmDetailModel.h"
#import <RLMRealm.h>
#import "FilmRealm.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface FilmDetailViewController : UIViewController <FilmDetailDelegate, UITextFieldDelegate>

@property (nonatomic, strong) FilmModel * filmModel;
@property (weak, nonatomic) IBOutlet UITextField *searchFilmTextField;
@property (weak, nonatomic) IBOutlet UIImageView *posterImgView;
@property (weak, nonatomic) IBOutlet UILabel *filmTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *releasedDateLabel;
@property (weak, nonatomic) IBOutlet UILabel *durationLabel;
@property (weak, nonatomic) IBOutlet UILabel *genreLabel;
@property (weak, nonatomic) IBOutlet UILabel *directorLabel;
@property (weak, nonatomic) IBOutlet UILabel *actorsLabel;
@property (weak, nonatomic) IBOutlet UILabel *plotLabel;
- (IBAction)addFilmButtonClicked:(id)sender;
@property (weak, nonatomic) IBOutlet UIButton *addFilmButton;

@end
