//
//  HomeViewController.m
//  Company
//
//  Created by Zhang on 7/6/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeView.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpHomeViews];
    // Do any additional setup after loading the view.
}


- (void)setUpHomeViews
{
    HomeView *homeViewMass = [[HomeView alloc] initWithFrame:CGRectMake(20, 74, ScreenWidth - 40, 82)];
    [homeViewMass setTitleText:@"成品质量分析"];
    [self.view addSubview:homeViewMass];
    
    HomeView *homeViewWeight = [[HomeView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(homeViewMass.frame) + 8, ScreenWidth - 40, 82)];
    [homeViewMass setTitleText:@"成品重量分析"];
    [self.view addSubview:homeViewWeight];
    
    HomeView *homeViewFlaw = [[HomeView alloc] initWithFrame:CGRectMake(20, CGRectGetMaxY(homeViewWeight.frame) + 8, ScreenWidth - 40, 82)];
    [homeViewMass setTitleText:@"成品瑕疵分析"];
    [self.view addSubview:homeViewFlaw];
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
