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
#import "ChartViewController.h"
#import "ChartBarViewController.h"

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
    HomeView *homeView;
    __weak typeof(self) weakSelf = self;
    for (NSInteger i = 0; i <array.count ; i ++) {
        homeView = [[HomeView alloc] initWithFrame:CGRectMake(20, height, ScreenWidth - 40, 82)];
        [homeView setTitleText:array[i] withViewTag:i + 1];
        height = height + 90;
        /**
         *  HomeViewBlock回调
         *
         *  @param tag 每个View都设置了tag，根据点击view返回的tag来确定点击的是哪个视图
         *
         *  @return
         */
        homeView.block = ^(NSInteger tag){
            [weakSelf setHomeDetailData:tag];
        };
        [self.view addSubview:homeView];
    }
    
    //创建主视图的View的手势来手气NavigationBar上的视图
    UITapGestureRecognizer *hidderHomeGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hidderHomeTableView:)];
    hidderHomeGesture.numberOfTapsRequired = 1;
    hidderHomeGesture.numberOfTouchesRequired = 1;
    //使其他在主视图上的手势可以得到执行
    hidderHomeGesture.cancelsTouchesInView = NO;
    [self.view addGestureRecognizer:hidderHomeGesture];
}

- (void)setHomeDetailData:(NSInteger)tag
{
    //这边是一个测试跳转的后面需要更改跳转的逻辑。
    HomeDetailViewController *homeDetailView = [[HomeDetailViewController alloc] init];
    switch (tag) {
        case 1:
        {
            homeDetailView.homeTitleArray = [[NSMutableArray alloc] initWithArray:@[@[@"序号",@"物料",@"总存量"]]];
            //传入二维数组进行tableView的绘制。
            homeDetailView.contentArray = [[NSMutableArray alloc] initWithArray:@[@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"]]];
            homeDetailView.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:homeDetailView animated:YES];
        }
            break;
         case 2:
        {
            UIStoryboard *mainStroy = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            
            ChartViewController *lineChartView = [mainStroy instantiateViewControllerWithIdentifier:@"ChartViewController"];
            lineChartView.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:lineChartView animated:YES];
//            homeDetailView.homeTitleArray = [[NSMutableArray alloc] initWithArray:@[@[@"序号",@"成品型号",@"标准重量",@"平均重量"]]];
//            homeDetailView.contentArray = [[NSMutableArray alloc] initWithArray:@[@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"],@[@"1",@"M1AC101",@"56.78",@"56.45"]]];
        }
            break;
        default:
        {
            UIStoryboard *mainStroy = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
            
            
            ChartBarViewController *barView = [mainStroy instantiateViewControllerWithIdentifier:@"ChartBarViewController"];
            barView.hidesBottomBarWhenPushed = YES;
            [self.navigationController pushViewController:barView animated:YES];
            
        }
            
//            homeDetailView.homeTitleArray = [[NSMutableArray alloc] initWithArray:@[@[@"序号",@"物料",@"总存量"]]];
//            homeDetailView.contentArray = [[NSMutableArray alloc] initWithArray:@[@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"],@[@"1",@"M1AC101",@"12381.00"]]];
            break;
    }
//    UIStoryboard *mainStroy = [UIStoryboard storyboardWithName:@"Main" bundle:nil];
//    
//    
//    ChartBarViewController *barView = [mainStroy instantiateViewControllerWithIdentifier:@"ChartBarViewController"];
//    [self.navigationController pushViewController:barView animated:YES];
//    homeDetailView.hidesBottomBarWhenPushed = YES;
//    [self.navigationController pushViewController:homeDetailView animated:YES];
}

/**
 *  创建NavigationBarTitleView视图
 *
 *  @return
 */
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
/**
 *  手势方法取消收起|弹出视图
 *
 *  @param gesture
 */
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

/**
 *  主视图手势 判断_homeTalbeView是否显示，显示的话就关闭
 *
 *  @param geture
 */
- (void)hidderHomeTableView:(UITapGestureRecognizer *)geture
{
    if (_homeTableView.hidden == NO) {
        [self tapGesture:_tapGesture];
    }
}

/**
 *  创建_homeTableView 后面逻辑数据根据服务器返回的数据填充,还待完善
 */
- (void)setUpHomeTableView
{
    _homeTableView = [[HomeTableView alloc] initWithFrame:CGRectMake(ScreenWidth/2 - 72.5, 64, 145, 217)];
    [_homeTableView setHomeArrayData:@[@"生产",@"库存",@"质量",@"其他1",@"其他2",@"其他3"]];
    _homeTableView.hidden = YES;
//    __weak typeof(self) weakSelf = self;
    /**
     *  _homeTableBlock回调点击的
     *
     *  @param indexPath 返回的NSIndexPath对象，可以根据indexPath.row来判断点击的事哪一行
     *
     *  @return 
     */
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
