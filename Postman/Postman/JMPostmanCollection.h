//
//  JMPostmanCollection.h
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMPostmanCollection : NSObject

@property (readonly ,strong, nonatomic) NSString *collectionName;
@property (readonly ,strong, nonatomic) NSArray *collectionRequests;

+ (instancetype)collectionFromBundle;

@end
