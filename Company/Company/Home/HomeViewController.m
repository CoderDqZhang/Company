//
//  HomeViewController.m
//  Company
//
//  Created by Zhang on 7/6/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"
#import "HomeTableView.h"
#import "HomeDetailViewController.h"

@interface HomeViewController ()

@property (nonatomic, strong) HomeTableView *homeTableView;
@property (nonatomic, strong) UITapGestureRecognizer *tapGesture;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpHomeViews];
    self.navigationItem.titleView = [self titleView];
    [self setUpHomeTableView];
    // Do any additional setup after loading the view.
}


- (void)setUpHomeViews
{
    NSArray *array = @[@"成品质量分析",@"成品重量分析",@"成品瑕疵分析"];
    CGFloat height = 74;
    HomeView *homeViewMass;
    __weak typeof(self) weakSelf = self;
    for (NSInteger i = 0; i <array.count ; i ++) {
        homeViewMass = [[HomeView alloc] initWithFrame:CGRectMake(20, height, ScreenWidth - 40, 82)];
        [homeViewMass setTitleText:array[i] withViewTag:i + 1];
        height = height + 90;
        homeViewMass.block = ^(NSInteger tag){
            [weakSelf setHomeDetailData:tag];
        };
        [self.view addSubview:homeViewMass];
    }
    
//    HomeView *homeViewMass = [[HomeView alloc] initWithFrame:CGRectMake(20, 74, ScreenWidth - 40, 82)];
//    [homeViewMass setTitleText:@"成品质量分析" withViewTag:1];
//    [self.view addSubview:homeViewMass];
//    
//    HomeView *homeViewWeight = [[HomeView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(homeViewMass.frame) + 8, ScreenWidth - 40, 82)];
//    [homeViewMass setTitleText:@"成品重量分析" withViewTag:2];
//    [self.view addSubview:homeViewWeight];
//    
//    HomeView *homeViewFlaw = [[HomeView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(homeViewWeight.frame) + 8, ScreenWidth - 40, 82)];
//    [homeViewMass setTitleText:@"成品瑕疵分析" withViewTag:3];
//    [self.view addSubview:homeViewFlaw];
    
    UITapGestureRecognizer *hidderHomeGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidderHomeTableView:)];
    hidderHomeGesture.numberOfTapsRequired = 1;
    hidderHomeGesture.numberOfTouchesRequired = 1;
    hidderHomeGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:hidderHomeGesture];
}

- (void)setHomeDetailData:(NSInteger)tag
{
    HomeDetailViewController *homeDetailView = [[HomeDetailViewController alloc] init];
    switch (tag) {
        case 1:
        {
            homeDetailView.homeTitleArray = [[NSMutableArray alloc] initWithArray:@[@[@"序号",@"物料",@"总存量"]]];
            homeDetailView.contentArray = [[NSMutableArray alloc] initWithArray:@[@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"]]];
        }
            break;
         case 2:
        {
            homeDetailView.homeTitleArray = [[NSMutableArray alloc] initWithArray:@[@[@"序号",@"成品型号",@"标准重量",@"平均重量"]]];
            homeDetailView.contentArray = [[NSMutableArray alloc] initWithArray:@[@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"]]];
        }
            break;
        default:
            homeDetailView.homeTitleArray = [[NSMutableArray alloc] initWithArray:@[@[@"序号",@"物料",@"总存量"]]];
            homeDetailView.contentArray = [[NSMutableArray alloc] initWithArray:@[@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"]]];
            break;
    }
    homeDetailView.hidesBottomBarWhenPushed = YES;
    [self.navigationController pushViewController:homeDetailView animated:YES];
}

- (UIView *)titleView
{
    UIView *titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 48, 25)];
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 35, 25)];
    titleLabel.text = @"功能";
    titleLabel.font = ApplicationNavigationBarFont;
    [titleView addSubview:titleLabel];
    UIImage *image = [UIImage imageNamed:@"function_down"];;
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(38, (25 - image.size.height)/2, image.size.width, image.size.height)];
    imageView.image = image;
    imageView.tag = 10;
    [titleView addSubview:imageView];
    
    _tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapGesture:)];
    _tapGesture.numberOfTapsRequired = 1;
    _tapGesture.numberOfTouchesRequired = 1;
    [titleView addGestureRecognizer:_tapGesture];
    return titleView;
}

- (void)tapGesture:(UITapGestureRecognizer *)gesture
{
    UIView *titleView = [gesture view];
    UIImageView *imageView = [titleView viewWithTag:10];
    if (_homeTableView.hidden == YES) {
        _homeTableView.hidden = NO;
        imageView.image = [UIImage imageNamed:@"function_up"];
    }else{
        _homeTableView.hidden = YES;
        imageView.image = [UIImage imageNamed:@"function_down"];
    }
    
}

- (void)hidderHomeTableView:(UITapGestureRecognizer *)geture
{
    if (_homeTableView.hidden == NO) {
        [self tapGesture:_tapGesture];
    }
}

- (void)setUpHomeTableView
{
    _homeTableView = [[HomeTableView alloc] initWithFrame:CGRectMake(ScreenWidth/2 - 72.5, 64, 145, 217)];
    [_homeTableView setHomeArrayData:@[@"生产",@"库存",@"质量",@"其他1",@"其他2",@"其他3"]];
    _homeTableView.hidden = YES;
//    __weak typeof(self) weakSelf = self;
    _homeTableView.block = ^(NSIndexPath *indexPath){
        NSLog(@"%ld",(long)indexPath.row);
    };
    [self.view addSubview:_homeTableView];
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

@end
