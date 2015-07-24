//
//  Modelphoto.h
//  aGirl
//
//  Created by Tran Trung Tuyen on 21/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import <Realm/Realm.h>
#import "Country.h"

@class Country;

@interface Modelphoto : RLMObject

@property NSInteger id;
@property int birth;
@property NSString *fullname;
@property int country_id;
@property NSString *nickname;
@property NSString *website;
@property NSString *created_at;
@property NSString *updated_at;

@property Country *country;

@property (readonly) NSArray *albums;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Modelphoto>
RLM_ARRAY_TYPE(Modelphoto)
