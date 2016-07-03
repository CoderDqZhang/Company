//
//  ProfileLabelTableViewCell.m
//  Company
//
//  Created by Zhang on 7/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ProfileLabelTableViewCell.h"

@implementation ProfileLabelTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configCell:(NSString *)title detail:(NSString *)detail
{
    self.titleLabel.text = title;
    self.detailLabel.text = detail;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
