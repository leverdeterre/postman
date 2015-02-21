//
//  JMRequestFactory.m
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import "JMRequestFactory.h"
#import "JMPostmanRequest.h"
#import "AFHTTPRequestOperationManager.h"

@interface JMRequestFactory ()
@property (strong, nonatomic) AFHTTPRequestOperationManager *manager;
@end

@implementation JMRequestFactory

+ (JMRequestFactory *)sharedInstance
{
    static dispatch_once_t once;
    static JMRequestFactory *sharedInstance;
    dispatch_once(&once, ^{
        sharedInstance = [[self alloc] init];
        sharedInstance.manager = [AFHTTPRequestOperationManager new];
    });
    return sharedInstance;
}

+ (AFHTTPRequestOperation *)operationFromPostmanRequest:(JMPostmanRequest *)request
{
    AFHTTPRequestOperation *operation;
    if ([request.method isEqualToString:@"GET"]) {
        if (request.data) {
            NSLog(@"request.data not actually supported in GET request");
        }
            
        operation = [[JMRequestFactory sharedInstance].manager GET:request.url parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"Request sucess");
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Request failed");
        }];
        
    } else if ([request.method isEqualToString:@"POST"]) {
        
        operation = [[JMRequestFactory sharedInstance].manager POST:request.url parameters:request.data success:^(AFHTTPRequestOperation *operation, id responseObject) {
            NSLog(@"Request sucess");
        } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
            NSLog(@"Request failed");
        }];
    }
    
    return operation;
}

@end
