//
//  JMResponseResultViewerViewController.m
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import "JMResponseResultViewerViewController.h"
#import "AFHTTPRequestOperation.h"

@interface JMResponseResultViewerViewController ()
@property (weak, nonatomic) IBOutlet UIWebView *webView;

//Data from WS call
@property (strong, nonatomic) AFHTTPRequestOperation *operation;
@property (strong, nonatomic) id responseObject;
@property (strong, nonatomic) NSError *operationError;
@end

@implementation JMResponseResultViewerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)setOperation:(AFHTTPRequestOperation *)operation responseObject:(id)obj error:(NSError *)error
{
    self.operation = operation;
    self.responseObject = obj;
    self.operationError = error;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.webView loadHTMLString:[self.responseObject description]  baseURL:nil];
}

@end