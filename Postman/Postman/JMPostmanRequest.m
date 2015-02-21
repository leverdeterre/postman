//
//  JMPostmanRequest.m
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import "JMPostmanRequest.h"

@implementation JMPostmanRequest

+ (instancetype)postmanRequestFromDictionary:(NSDictionary *)dict
{
    JMPostmanRequest *r = [[JMPostmanRequest alloc] initWithDictionary:dict];
    return r;
}

- (instancetype)initWithDictionary:(NSDictionary *)dict
{
    self = [super init];
    if (self) {
        _collectionId = [dict objectForKey:@"collectionId"];
        _requestDescription = [dict objectForKey:@"description"];
        _method = [dict objectForKey:@"method"];
        _name = [dict objectForKey:@"name"];
        _url = [dict objectForKey:@"url"];
        _data = [dict objectForKey:@"data"];
    }
    return self;
}

@end
