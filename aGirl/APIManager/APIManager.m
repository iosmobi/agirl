//
//  APIManager.m
//  AiWall
//
//  Created by Tran Trung Tuyen on 17/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import "APIManager.h"
#import "Album.h"


@implementation APIManager


+ (instancetype)shared
{
    static APIManager *_shared = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shared = [[self alloc] init];

    });
    
    return _shared;
}

- (instancetype)init
{
    // NSURLSessionConfiguration
    // initWithBaseURL:sessionConfiguration:
    // [NSURLSessionConfiguration defaultSessionConfiguration]
    if (self = [super initWithBaseURL:[NSURL URLWithString:API_BASE]]) {
        
        AFJSONResponseSerializer *jsonResponseSerializer = [AFJSONResponseSerializer serializer];
        jsonResponseSerializer.removesKeysWithNullValues = YES;
        self.responseSerializer = jsonResponseSerializer;
        
//        self.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeCertificate];
//        self.securityPolicy.allowInvalidCertificates = YES;
        
        // responseSerializer default AFJSONResponseSerializer
        // requestSerializer default AFHTTPRequestSerializer
        
    }
    return self;
}

- (NSURLSessionDataTask *)dataTaskWithRequest:(NSURLRequest *)request
                            completionHandler:(void (^)(NSURLResponse *, id, NSError *))completionHandler
{
    NSMutableURLRequest *mutableRequest = [request mutableCopy];
    mutableRequest.timeoutInterval = 20.0;
    return [super dataTaskWithRequest:mutableRequest completionHandler:completionHandler];
}

/**
 *  Lấy dữ liệu mới, import vào database
 *
 *  @param handler hàm complate
 */

- (void)fetchNew:(void (^)(NSArray *news, NSError *error))handler
{

    NSLog(@"%@",[RLMRealm defaultRealmPath]);
    [self GET:@"albums/test" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
        
        NSLog(@"%@",responseObject);
        
        dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
        
        dispatch_async(queue, ^{
            
            @autoreleasepool {
                
                RLMRealm *realm = [RLMRealm defaultRealm];
                
                [realm beginWriteTransaction];

                for(NSDictionary *album in responseObject){
                    [Album createOrUpdateInDefaultRealmWithValue:album];
                    NSLog(@"run");
                }
                
                [realm commitWriteTransaction];
                
//                dispatch_async(dispatch_get_main_queue(), ^{
//                    handler(nil,nil);
//                });
            }
        });
        
    } failure:^(NSURLSessionDataTask *task, NSError *error) {
        NSLog(@"%@",error);
    }];
    
}


//- (void)fetchNewData:(void (^)(NSArray *news, NSError *error))handler{
//    [self GET:@"image/I3" parameters:nil success:^(NSURLSessionDataTask *task, id responseObject) {
//
//        NSArray *wallsJSON = responseObject;
//        
//        dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//            @autoreleasepool {
//                RLMRealm *realm = [RLMRealm defaultRealm];
//                
//                [realm beginWriteTransaction];
//                
//                for(NSDictionary *wall in wallsJSON){
//                    [Wall createOrUpdateInDefaultRealmWithValue:wall];
//                }
//                
//                [realm commitWriteTransaction];
//            }
//        });
//        
//    } failure:nil];
//}




@end

