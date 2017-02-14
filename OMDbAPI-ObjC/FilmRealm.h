//
//  FilmRealm.h
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 13/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import <Realm/Realm.h>
#import "FilmModel.h"

@interface FilmRealm : RLMObject

@property NSString * poster;
@property NSString * title;
@property NSString * releasedDate;
@property NSString * duration;
@property NSString * genre;
@property NSString * director;
@property NSString * actors;
@property NSString * plot;
@property NSString * response;
@property NSString * imdbID;

-(id) initWithMantleModel:(FilmModel *) filmModel;
@end
