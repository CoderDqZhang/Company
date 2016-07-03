//
//  CompleteViewController.m
//  Company
//
//  Created by Zhang on 7/3/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "CompleteViewController.h"
#import "ProfilePhotoTableViewCell.h"
#import "ProfileFieldTableViewCell.h"
#import "ProfileLabelTableViewCell.h"
#import "UIViewController+DismissKeyboard.h"

@interface CompleteViewController ()<UITableViewDelegate, UITableViewDataSource>


@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (copy, nonatomic) NSArray *titleArray;

@end

@implementation CompleteViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpTableViewCell];
    [self setupForDismissKeyboard];
    [self setData];
    // Do any additional setup after loading the view.
}

- (void)setData
{
    _titleArray = @[@"手机号",@"用户姓名",@"公司名称",@"工厂名称",@"岗位名称",@"设置密码",@"重复密码"];
}

- (void)setUpTableViewCell
{
//    [self.tableView registerClass:[ProfilePhotoTableViewCell class] forCellReuseIdentifier:@""];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - UITableViewDelegate&DataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0) {
        return 8;
    }
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0 && indexPath.row == 0) {
        return 80;
    }
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.00001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 20;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            static NSString *cellIndef = @"ProfilePhotoTableViewCell";
            ProfilePhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndef forIndexPath:indexPath];
            return cell;
        }else if (indexPath.row == 6 || indexPath.row == 7){
            static NSString *cellIndef = @"ProfileFieldTableViewCell";
            ProfileFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndef forIndexPath:indexPath];
            [cell configCell:_titleArray[indexPath.row - 1] textField:_titleArray[indexPath.row - 1]];
            return cell;
        }else{
            static NSString *cellIndef = @"ProfileLabelTableViewCell";
            ProfileLabelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndef forIndexPath:indexPath];
            [cell configCell:_titleArray[indexPath.row - 1] detail:_titleArray[indexPath.row - 1]];
            return cell;
        }
    }else{
        static NSString *CellIndef = @"RegisterCell";
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIndef];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIndef];
        }
        
        return cell;
    }
}

@end
