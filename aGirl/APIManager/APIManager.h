//
//  APIManager.h
//  AiWall
//
//  Created by Tran Trung Tuyen on 17/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import "AFHTTPSessionManager.h"

#define API_BASE @"http://girls.iosmobi.com/api/v1/"
//#define API_BASE @"http://api.agirl.dev/v1/"

@interface APIManager : AFHTTPSessionManager

// singleton
+ (instancetype)shared;

- (void)fetchNew:(void (^)(NSArray *news, NSError *error))handler;;
//- (void)fetchNewData:(void (^)(NSArray *news, NSError *error))handler;

@end
