//
//  FilmDetailService.m
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import "FilmDetailService.h"

@implementation FilmDetailService
+(void)searchFilm:(NSString *) title success:(void(^) (id responseObject)) success failure:(void(^)(NSError * error)) failure {
    
    NSMutableDictionary * parameters = [[NSMutableDictionary alloc] init];
    parameters[@"t"] = [NSString stringWithFormat:@"%@", title];
    parameters[@"y"] = @"";
    parameters[@"plot"] = @"short";
    parameters[@"r"] = @"json";
    
    [self getFilmInformationWithParameters:parameters withSuccess:^(id responseObject) {
        if (responseObject) {
            //NSLog(@"my response - film detail service -: %@", responseObject);
            success(responseObject);
        }
    } orFailure:^(NSError * error) {
        if (error) {
            //NSLog(@"error- film detail service -: %@", error);
            failure(error);
        }
    }];
}
@end
