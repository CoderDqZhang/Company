//
//  ProfileFieldTableViewCell.h
//  Company
//
//  Created by Zhang on 7/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ProfileFieldTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;

- (void)configCell:(NSString *)title textField:(NSString *)text;


@end
