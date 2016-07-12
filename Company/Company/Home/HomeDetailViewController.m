//
//  HomeDetailViewController.m
//  Company
//
//  Created by Zhang on 7/11/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HomeDetailViewController.h"
#import "HomeTitleTableViewCell.h"
#import "HomeViewCell.h"
#import "ChartViewController.h"
#import "ChartBarViewController.h"

@interface HomeDetailViewController ()<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;



@end

@implementation HomeDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setUpTableView];
    [self setNavigationBarItem];
    // Do any additional setup after loading the view.
}

- (void)setNavigationBarItem
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"application_search"] style:UIBarButtonItemStylePlain target:self action:@selector(searchBarBtnPress:)];
}

- (void)searchBarBtnPress:(UIBarButtonItem *)sender
{
    
}

- (void)setUpTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
        return 40;
    }
    return 30;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _contentArray.count + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 0) {
       static NSString *cellIndef = @"HomeTileCell";
        HomeTitleTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndef];
        if (cell == nil) {
            cell = [[HomeTitleTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndef];
        }
        [cell setData:_homeTitleArray[indexPath.row]];
        return cell;
    }else{
        static NSString *cellIndef = @"HomeTileCell";
        HomeViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIndef];
        if (cell == nil) {
            cell = [[HomeViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIndef];
        }
        [cell setData:_contentArray[indexPath.row - 1]];
        return cell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row > 0) {
        UIStoryboard *mainStory = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
        ChartViewController *chartView = [mainStory instantiateViewControllerWithIdentifier:@"ChartViewController"];
        chartView.hidesBottomBarWhenPushed = YES;
        [self.navigationController pushViewController:chartView animated:YES];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
