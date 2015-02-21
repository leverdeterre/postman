//
//  JMResponseResultViewerViewController.h
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AFHTTPRequestOperation;
@interface JMResponseResultViewerViewController : UIViewController

- (void)setOperation:(AFHTTPRequestOperation *)operation responseObject:(id)obj error:(NSError *)error;

@end
