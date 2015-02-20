//
//  ViewController.m
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import "ViewController.h"
#import "JMPostmanCollection.h"

@interface ViewController ()
@property (strong, nonatomic) JMPostmanCollection *collection;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.collection = [JMPostmanCollection collectionFromBundle];
    [self.tableView registerNib:[UINib nibWithNibName:@"JMRequestTableViewCell" bundle:nil]
         forCellReuseIdentifier:@"JMRequestTableViewCell"];
    
}

#pragma mark - UITableViewDatasource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self.tableView dequeueReusableCellWithIdentifier:@"JMRequestTableViewCell"];
}

@end