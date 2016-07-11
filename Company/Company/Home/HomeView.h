//
//  HomeView.h
//  Company
//
//  Created by Zhang on 7/6/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void (^LableTapGesture)(NSInteger tag);

@interface HomeView : UIView

@property (nonatomic, strong) LableTapGesture block;

- (void)setTitleText:(NSString *)title withViewTag:(NSInteger)tag;

@end
