//
//  FilmDetailService.h
//  OMDbAPI-ObjC
//
//  Created by Matheus Fusco on 10/02/17.
//  Copyright © 2017 MatheusFusco. All rights reserved.
//

#import "APIManager.h"

@interface FilmDetailService : APIManager
+(void)searchFilm:(NSString *) title success:(void(^) (id responseObject)) success failure:(void(^)(NSError * error)) failure;
@end
