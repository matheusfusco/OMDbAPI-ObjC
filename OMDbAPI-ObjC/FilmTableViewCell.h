//
//  FilmTableViewCell.h
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <SDWebImage/UIImageView+WebCache.h>
#import "FilmModel.h"

@interface FilmTableViewCell : UITableViewCell
@property (nonatomic, strong) FilmModel * film;
@property (weak, nonatomic) IBOutlet UIImageView *filmPoster;
@property (weak, nonatomic) IBOutlet UILabel *filmTitle;

@end
