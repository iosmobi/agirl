//
//  Country.m
//  aGirl
//
//  Created by Tran Trung Tuyen on 23/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import "Country.h"
#import "Modelphoto.h"

@implementation Country

+ (NSString*)primaryKey {
    return @"id";
}


- (NSArray *)albums {
    return [self linkingObjectsOfClass:@"Album" forProperty:@"country"];
}


// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

@end
