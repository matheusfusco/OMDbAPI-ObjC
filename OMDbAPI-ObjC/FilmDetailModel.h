//
//  FilmDetailModel.h
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FilmDetailService.h"
#import "FilmModel.h"
#import "FilmRealm.h"
#import <MBProgressHUD.h>
#import <RLMRealm.h>

@class FilmDetailModel;
@protocol FilmDetailDelegate <NSObject>
@required
-(void)fetchedFilmInformation:(FilmModel *)film;
-(void)errorWhileFetchingFilmInformation:(NSError *) error;
@end
@interface FilmDetailModel : NSObject
@property (nonatomic, retain) id <FilmDetailDelegate> delegate;
-(void)fetchFilmInformationBasedOnTitle:(NSString *) title;
-(void)saveFilmToFavorites:(FilmModel *)film completion:(void(^) (BOOL success)) completion;
@end
