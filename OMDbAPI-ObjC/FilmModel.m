//
//  FilmModel.m
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import "FilmModel.h"

@implementation FilmModel

+(NSDictionary *)JSONKeyPathsByPropertyKey {
    return @{
             @"poster" : @"Poster",
             @"title" : @"Title",
             @"releasedDate" : @"Released",
             @"duration" : @"Runtime",
             @"genre" : @"Genre",
             @"director" : @"Director",
             @"actors" : @"Actors",
             @"plot" : @"Plot",
             @"response" : @"Response",
             @"imdbID" : @"imdbID"
             };
}

-(instancetype)initWithDictionary:(NSDictionary *)dictionaryValue error:(NSError *__autoreleasing *)error {
    self = [super initWithDictionary:dictionaryValue error:error];
    if (!self) return nil;
    
    return self;
}

@end
