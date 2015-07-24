//
//  Photo.h
//  aGirl
//
//  Created by Tran Trung Tuyen on 21/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import <Realm/Realm.h>

@interface Photo : RLMObject

@property NSInteger id;
@property long album_id;
@property NSString *description;
@property NSString *google_drive_id;
@property NSString *photo_md5;
@property NSString *photo_url;

@property NSString *status;
@property NSString *thumb_url;
@property NSString *title;

@property NSString *created_at;
@property NSString *updated_at;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Photo>
RLM_ARRAY_TYPE(Photo)
