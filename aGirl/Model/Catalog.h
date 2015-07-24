//
//  Catalog.h
//  aGirl
//
//  Created by Tran Trung Tuyen on 22/07/2015.
//  Copyright (c) Năm 2015 Tran Trung Tuyen. All rights reserved.
//

#import <Realm/Realm.h>

@interface Catalog : RLMObject

@property NSInteger id;
@property NSString *name;

@property (readonly) NSArray *albums;


@end

// This protocol enables typed collections. i.e.:
// RLMArray<Catalog>
RLM_ARRAY_TYPE(Catalog)
