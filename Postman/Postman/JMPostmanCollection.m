//
//  JMPostmanCollection.m
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import "JMPostmanCollection.h"
#import "JMPostmanRequest.h"

@implementation JMPostmanCollection

+ (instancetype)collectionFromBundle
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"postman_backup" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    JMPostmanCollection *collect = [JMPostmanCollection new];
    [collect setupWithDictionary:[NSJSONSerialization JSONObjectWithData:data options:0 error:NULL]];
    return collect;
}

- (void)setupWithDictionary:(NSDictionary *)dict
{
    NSMutableArray *arrayM = [NSMutableArray new];
    for (NSDictionary *collectionDict in [dict objectForKey:@"collections"]) {
        NSArray *requests = [collectionDict objectForKey:@"requests"];
        
        for (NSDictionary *reqDict in requests) {
            JMPostmanRequest *req = [JMPostmanRequest postmanRequestFromDictionary:reqDict];
            [arrayM addObject:req];
        }
    }

    
    _collectionName = [dict objectForKey:@"name"];
    _collectionRequests = arrayM;
}

@end
