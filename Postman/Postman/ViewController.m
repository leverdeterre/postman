//
//  ViewController.m
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import "ViewController.h"
#import "JMRequestTableViewCell.h"
#import "UIActivityIndicatorView+AFNetworking.h"

//Model
#import "JMPostmanCollection.h"
#import "JMRequestFactory.h"
#import "AFHTTPRequestOperation.h"

//Controller
#import "JMResponseResultViewerViewController.h"

@interface ViewController ()
@property (strong, nonatomic) JMPostmanCollection *collection;
@property (strong, nonatomic) AFHTTPRequestOperation *currentOperation;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.collection = [JMPostmanCollection collectionFromBundle];
    [self.tableView registerNib:[UINib nibWithNibName:@"JMRequestTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"JMRequestTableViewCell"];
    [self.tableView reloadData];
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.collection.collectionRequests.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    JMRequestTableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"JMRequestTableViewCell"];
    [cell setupWithPostmanRequest:self.collection.collectionRequests[indexPath.row]];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    JMPostmanRequest *r = self.collection.collectionRequests[indexPath.row];
    if (_currentOperation) {
        [_currentOperation cancel];
    }
    
    __weak ViewController *weakSelf = self;
    _currentOperation = [JMRequestFactory operationFromPostmanRequest:r];
    [_currentOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject) {
        JMResponseResultViewerViewController *vc = [JMResponseResultViewerViewController new];
        [vc setOperation:operation responseObject:responseObject error:nil];
        [weakSelf.navigationController pushViewController:vc animated:YES];
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        JMResponseResultViewerViewController *vc = [JMResponseResultViewerViewController new];
        [vc setOperation:operation responseObject:nil error:error];
        [weakSelf.navigationController pushViewController:vc animated:YES];
    }];
}

@end