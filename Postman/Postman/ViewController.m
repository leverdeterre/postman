//
//  ViewController.m
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import "ViewController.h"
#import "JMPostmanCollection.h"
#import "JMRequestTableViewCell.h"

@interface ViewController ()
@property (strong, nonatomic) JMPostmanCollection *collection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.tableView setContentInset:UIEdgeInsetsMake(50,0,0,0)];
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
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}

@end