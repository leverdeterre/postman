//
//  JMRequestFactory.h
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import <Foundation/Foundation.h>

@class JMPostmanRequest;
@class AFHTTPRequestOperation;
@interface JMRequestFactory : NSObject

+ (JMRequestFactory *)sharedInstance;
+ (AFHTTPRequestOperation *)operationFromPostmanRequest:(JMPostmanRequest *)request;

@end
