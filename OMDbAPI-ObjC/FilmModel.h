//
//  FilmModel.h
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import <Mantle/Mantle.h>

@interface FilmModel : MTLModel <MTLJSONSerializing>

@property (nonatomic, copy) NSString * poster;
@property (nonatomic, copy) NSString * title;
@property (nonatomic, copy) NSString * releasedDate;
@property (nonatomic, copy) NSString * duration;
@property (nonatomic, copy) NSString * genre;
@property (nonatomic, copy) NSString * director;
@property (nonatomic, copy) NSString * actors;
@property (nonatomic, copy) NSString * plot;
@property (nonatomic, copy) NSString * response;
@property (nonatomic, copy) NSString * imdbID;

@end
