//
//  ProfileFieldTableViewCell.m
//  Company
//
//  Created by Zhang on 7/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ProfileFieldTableViewCell.h"

@implementation ProfileFieldTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)configCell:(NSString *)title textField:(NSString *)text
{
    self.titleLabel.text = title;
    self.textField.text = text;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
