//
//  FilmRealm.m
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 13/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import "FilmRealm.h"

@implementation FilmRealm

-(id)initWithMantleModel:(FilmModel *)filmModel {
    self = [super init];
    if (!self) {
        return nil;
    }
    
    self.poster = filmModel.poster;
    self.title = filmModel.title;
    self.releasedDate = filmModel.releasedDate;
    self.duration = filmModel.duration;
    self.genre = filmModel.genre;
    self.director = filmModel.director;
    self.actors = filmModel.actors;
    self.plot = filmModel.plot;
    self.response = filmModel.response;
    self.imdbID = filmModel.imdbID;
    
    return self;
}

@end
