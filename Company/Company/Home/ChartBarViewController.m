//
//  ChartBarViewController.m
//  Company
//
//  Created by Zhang on 7/12/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ChartBarViewController.h"
#import "PNChart.h"

@interface ChartBarViewController ()

@property (weak, nonatomic) IBOutlet UIView *charBarView;

@end

@implementation ChartBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"成品质量分析";
    [self setUpChartBarView];
    // Do any additional setup after loading the view.
}

/**
 *  创建柱状图
 */
- (void)setUpChartBarView
{
    PNBarChart * barChart = [[PNBarChart alloc]initWithFrame:CGRectMake(24,35,SCREEN_WIDTH - 40,155.0)];
    //bar背景视图
    [barChart setBarBackgroundColor:[UIColor whiteColor]];
    
    barChart.yChartLabelWidth = 5.0;
    barChart.chartMarginLeft = 10.0;
    barChart.chartMarginRight = 10.0;
    barChart.chartMarginTop = 5.0;
    barChart.chartMarginBottom = 10.0;
    barChart.barWidth = 16.0;
    barChart.xLabelWidth = 15.0;
    barChart.showChartBorder = NO;
    barChart.chartBorderColor = [UIColor clearColor];

    barChart.isGradientShow = NO;
    barChart.isShowNumbers = NO;
    //X轴数据，
    [barChart setXLabels:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16"]];
    [barChart setYLabels:@[@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10"]];
    //Y轴数据
    NSArray *yValues = @[@1, @10,@2,@6,@3,@3,@4,@1,@1,@9,@1, @10,@2,@6,@3,@3];
    [barChart setYValues:yValues];
    NSMutableArray *colors = [NSMutableArray arrayWithCapacity:yValues.count];
    for (NSInteger i = 0; i < yValues.count; i ++ ) {
        if (i%2 == 0) {
            [colors addObject:[UIColor colorWithHexString:ChartsBarColorDarkBlue]];
        }else{
            [colors addObject:[UIColor colorWithHexString:ChartsBarColorLinBlue]];
        }
    }
    [barChart setStrokeColors:colors.copy];
    [barChart strokeChart];
    
    //加载在视图上
    [_charBarView addSubview:barChart];
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
