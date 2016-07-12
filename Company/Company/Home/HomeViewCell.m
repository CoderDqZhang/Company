//
//  HomeViewCell.m
//  Company
//
//  Created by Zhang on 7/11/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HomeViewCell.h"

@implementation HomeViewCell


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setData:(NSArray *)contentArray
{
    CGFloat titleWidth = (ScreenWidth - 40)/((CGFloat)contentArray.count);
    for (NSInteger i = 0; i < contentArray.count; i ++) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 + i * titleWidth, 0, titleWidth - 1, 30)];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.backgroundColor = [UIColor whiteColor];
        titleLabel.textColor = [UIColor lightGrayColor];
        titleLabel.layer.borderColor = [[UIColor lightGrayColor] CGColor];
        titleLabel.layer.borderWidth = 0.5;
        titleLabel.font = [UIFont systemFontOfSize:12.0];
        titleLabel.text = contentArray[i];
        [self.contentView addSubview:titleLabel];
    }
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
