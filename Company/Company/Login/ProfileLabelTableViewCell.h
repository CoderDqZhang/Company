//
//  ProfileLabelTableViewCell.h
//  Company
//
//  Created by Zhang on 7/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileLabelTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)configCell:(NSString *)title detail:(NSString *)detail;

@end
