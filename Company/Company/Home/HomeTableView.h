//
//  HomeTableView.h
//  Company
//
//  Created by Zhang on 7/11/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^TableViewSelectIndexPath)(NSIndexPath *indexPath);

@interface HomeTableView : UIView


@property (nonatomic, copy) NSMutableArray *tableViewArray;

@property (nonatomic, strong) TableViewSelectIndexPath block;


- (void)setHomeArrayData:(NSArray *)array;


@end
