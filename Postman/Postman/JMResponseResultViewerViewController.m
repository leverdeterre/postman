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
@property (assign, nonatomic) CFTimeInterval timeinterval;
@end

@implementation JMResponseResultViewerViewController

- (void)setOperation:(AFHTTPRequestOperation *)operation responseObject:(id)obj error:(NSError *)error timeIntervale:(CFTimeInterval)interval
{
    self.operation = operation;
    self.responseObject = obj;
    self.operationError = error;
    self.timeinterval = interval;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    [self.webView loadHTMLString:[self htmlString]  baseURL:nil];
}

#pragma mark - Compose helper

- (NSString *)htmlString
{
    NSMutableString *html = [[NSMutableString alloc] init];
    [html appendString:@"<HTML>"];
    [html appendString:@"<HEAD>"];
    [html appendString:@"<style>table {border-collapse: collapse;}  table, th, td { border: 1px solid black;}</style>"];
    [html appendString:@"</HEAD>"];
    [html appendString:@"<BODY>"];
    [html appendFormat:@"%@",[self htmtInsideBodyString]];
    [html appendString:@"</BODY>"];
    [html appendString:@"</HTML>"];
    return html;
}

- (NSString *)htmtInsideBodyString
{
    NSMutableString *html = [[NSMutableString alloc] init];
    [html appendString:@"<TABLE>"];
    [html appendString:@"<TR>"];
        [html appendString:@"<TD>"];
        [html appendString:@"<strong>Request Headers</strong>"];
        [html appendString:@"</TD>"];
        [html appendString:@"<TD>"];
        [html appendFormat:@"%@",[self htmlStringForDictionary:self.operation.request.allHTTPHeaderFields]];
        [html appendString:@"</TD>"];
    [html appendString:@"</TR>"];
    
    if (self.operation.response) {
        [html appendString:@"<TR>"];
        [html appendString:@"<TD>"];
        [html appendString:@"<strong>Response Headers</strong>"];
        [html appendString:@"</TD>"];
        [html appendString:@"<TD>"];
        [html appendFormat:@"%@",[self htmlStringForDictionary:self.operation.response.allHeaderFields]];
        [html appendString:@"</TD>"];
        [html appendString:@"</TR>"];
    }

    [html appendString:@"<TR>"];
        [html appendString:@"<TD>"];
        [html appendString:@"<strong>Duration</strong>"];
        [html appendString:@"</TD>"];
        [html appendString:@"<TD>"];
        [html appendFormat:@"%lf second(s)",self.timeinterval];
        [html appendString:@"</TD>"];
    [html appendString:@"</TR>"];
    
    [html appendString:@"</TABLE>"];
    
    [html appendString:@"<BR/>"];
    [html appendString:@"<BR/>"];
    [html appendString:@"<strong>Response</strong>"];
    if (self.operation.error) {
        [html appendFormat:@"%@",[self.operation.error description]];
        
    } else {
        [html appendFormat:@"%@",[self.responseObject description]];
    }
    return html;
}

- (NSString *)htmlStringForDictionary:(NSDictionary *)dict
{
    NSMutableString *html = [[NSMutableString alloc] init];

    for (NSString *key in dict.allKeys) {
        [html appendFormat:@"<strong>%@</strong> : %@ <br/>",key, [dict objectForKey:key]];
    }
    
    return html;
}


@end
