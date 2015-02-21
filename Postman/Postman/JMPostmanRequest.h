//
//  JMPostmanRequest.h
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JMPostmanRequest : NSObject

@property (readonly,strong, nonatomic) NSString *collectionId;
@property (readonly,strong, nonatomic) NSString *requestDescription;
@property (readonly,strong, nonatomic) NSString *method;
@property (readonly,strong, nonatomic) NSString *name;
@property (readonly,strong, nonatomic) NSString *url;
@property (readonly,strong, nonatomic) NSString *data;

+ (instancetype)postmanRequestFromDictionary:(NSDictionary *)dict;

@end
