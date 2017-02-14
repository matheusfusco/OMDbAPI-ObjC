//
//  APIManager.h
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
#import "Constants.h"

@interface APIManager : NSObject
+(void)getFilmInformationWithParameters:(NSDictionary *) parameters withSuccess:(void (^) (id responeObject)) success orFailure:(void (^) (NSError * error)) failure;
@end
