//
//  JMRequestTableViewCell.m
//  Postman
//
//  Created by jerome morissard on 21/02/2015.
//  Copyright (c) 2015 Jerome Morissard. All rights reserved.
//

#import "JMRequestTableViewCell.h"
#import "JMPostmanRequest.h"

@interface JMRequestTableViewCell ()
@property (weak, nonatomic) IBOutlet UILabel *requestTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *requestDetailLabel;
@end

@implementation JMRequestTableViewCell

- (void)setupWithPostmanRequest:(JMPostmanRequest *)postmanRequest
{
    _requestTitleLabel.text = postmanRequest.name;
    _requestDetailLabel.text = postmanRequest.requestDescription;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
