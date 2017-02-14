//
//  APIManager.m
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import "APIManager.h"

@implementation APIManager

+(void)getFilmInformationWithParameters:(NSDictionary *) parameters withSuccess:(void (^) (id responeObject)) success orFailure:(void (^) (NSError * error)) failure {
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    
    NSString * fullURL = [NSString stringWithFormat:@"%@?t=%@&y=%@&plot=%@&r=%@", URL_API, parameters[@"t"], parameters[@"y"], parameters[@"plot"], parameters[@"r"]];
    
    [manager GET:fullURL parameters:nil progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            //NSLog(@"my response - API Manager -: %@", responseObject);
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull errors) {
        if (errors) {
            //NSLog(@"errors - API Manager -: %@", errors);
            failure(errors);
        }
    }];
}
@end
