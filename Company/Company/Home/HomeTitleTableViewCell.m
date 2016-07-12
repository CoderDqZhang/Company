//
//  HomeTitleTableViewCell.m
//  Company
//
//  Created by Zhang on 7/11/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HomeTitleTableViewCell.h"

@implementation HomeTitleTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
    }
    return self;
}

//36 133 150
//67 170 171
//86 189 187
/**
 *  根据传进来的数组数据创建label，label的颜色根据传进来的值颜色渐变
 *
 *  @param titleArray 数组数据
 */
- (void)setData:(NSArray *)titleArray
{
    CGFloat titleWidth = (ScreenWidth - 40)/((CGFloat)titleArray.count);
    for (NSInteger i = 0; i < titleArray.count; i ++) {
        UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20 + i * titleWidth, 10, titleWidth, 30)];
        titleLabel.backgroundColor = [UIColor colorWithRed: 30 * (i + 1)/255.0 green:(130 + 30 * (i + 1))/255.0 blue:(150 + i * 20)/255.0 alpha:1.0];
        titleLabel.textAlignment = NSTextAlignmentCenter;
        titleLabel.font = [UIFont systemFontOfSize:13.0];
        titleLabel.textColor = [UIColor whiteColor];
        titleLabel.text = titleArray[i];
        [self.contentView addSubview:titleLabel];
    }
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
