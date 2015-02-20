//
//  JMPostmanCollection.m
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import "JMPostmanCollection.h"

@implementation JMPostmanCollection

+ (instancetype)collectionFromBundle
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"postman_backup" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:0 error:NULL];
    return [self new];
}

@end
