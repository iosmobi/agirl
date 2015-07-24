//
//  Album.h
//  aGirl
//
//  Created by Tran Trung Tuyen on 21/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import <Realm/Realm.h>
#import "Modelphoto.h"
#import "Photo.h"
#import "Catalog.h"
#import "Country.h"


@class Photo;
@class Modelphoto;
@class Catalog;
@class Country;

@interface Album : RLMObject

@property NSInteger id;
@property NSString *title;
@property NSString *cover;
@property NSString *description;
@property long modelphoto_id;
//@property double photographer_id;
//@property double user_id;
@property int catalog_id;
@property long views;
@property long likes;
@property NSString *status;
@property NSString *source;
@property NSString *created_at;
@property NSString *updated_at;


@property Modelphoto *modelphoto;
@property Catalog *catalog;
@property Country *country;
@property RLMArray<Photo> *photos;



@end

// This protocol enables typed collections. i.e.:
// RLMArray<Album>
RLM_ARRAY_TYPE(Album)
