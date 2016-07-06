//
//  HomeView.m
//  Company
//
//  Created by Zhang on 7/6/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HomeView.h"

#define LabelWidth 130
#define OriginY 25

@interface HomeView()

@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *lineLabel;
@property (nonatomic, strong) UIImageView *productImage;

@end

@implementation HomeView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpView];
    }
    return self;
}

- (void)setUpView
{
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth - 40, self.frame.size.height)];
    _imageView.image = [UIImage imageNamed:@"function_background"];
    [self addSubview:_imageView];
    
    UIImage *image = [UIImage imageNamed:@"function_image"];
    _productImage = [[UIImageView alloc] init];
    _productImage.frame = CGRectMake((self.frame.size.width - image.size.width - LabelWidth - 10)/2, OriginY, image.size.width, image.size.height);
    _productImage.image = [UIImage imageNamed:@"function_image"];
    [self addSubview:_productImage];
    
    _titleLabel = [[UILabel alloc] init];
    _titleLabel.frame = CGRectMake(CGRectGetMaxX(_productImage.frame) + 10, OriginY + 3, LabelWidth, 20);
    _titleLabel.text = @"成品质量分析";
    _titleLabel.textColor = [UIColor whiteColor];
    _titleLabel.font = [UIFont systemFontOfSize:20];
    [self addSubview:_titleLabel];
    
    _lineLabel = [[UILabel alloc] init];
    _lineLabel.frame = CGRectMake(CGRectGetMaxX(_productImage.frame) + 10, CGRectGetMaxY(_titleLabel.frame) + 2, LabelWidth, 1);
    _lineLabel.backgroundColor = [UIColor whiteColor];
    [self addSubview:_lineLabel];

}

- (void)setTitleText:(NSString *)title
{
    _titleLabel.text = title;
}

@end
