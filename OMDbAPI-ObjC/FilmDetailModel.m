//
//  FilmDetailModel.m
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import "FilmDetailModel.h"

@implementation FilmDetailModel
-(void)fetchFilmInformationBasedOnTitle:(NSString *)title {
    [FilmDetailService searchFilm:title success:^(id responseObject) {
        //NSLog(@"Response - model -: %@", responseObject);
        if (responseObject) {
            FilmModel * f = [MTLJSONAdapter modelOfClass:[FilmModel class] fromJSONDictionary:responseObject error:nil];
            [self.delegate fetchedFilmInformation:f];
        }
    } failure:^(NSError *error) {
        //NSLog(@"Error - model -: %@", error);
        [self.delegate errorWhileFetchingFilmInformation:error];
    }];
}

-(void)saveFilmToFavorites:(FilmModel *)film completion:(void(^) (BOOL success)) completion {
    RLMRealm * realm = [RLMRealm defaultRealm];
    RLMResults * filmResults = [FilmRealm allObjectsInRealm:realm];
    BOOL found = false;
    
    if (filmResults.count > 0) {
        for (FilmRealm * filmRealm in filmResults) {
            if ([filmRealm.imdbID isEqualToString:film.imdbID]) {
                found = true;
                completion(NO);
            }
        }
    }
    
    if (!found) {
        FilmRealm * filmRealm = [[FilmRealm alloc] initWithMantleModel:film];
        [realm beginWriteTransaction];
        [realm addObject:filmRealm];
        [realm commitWriteTransaction];
        completion(YES);
    }
}
@end
