//
//  ChartViewController.m
//  Company
//
//  Created by Zhang on 7/11/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "ChartViewController.h"
#import "PNChart.h"

@interface ChartViewController ()

@property (weak, nonatomic) IBOutlet UIView *infoView;
@property (weak, nonatomic) IBOutlet UIView *chartView;
@end

@implementation ChartViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"胶料结存分析";
    self.view.backgroundColor = [UIColor colorWithHexString:ApplicationBackGroundColor];
    [self setUpView];
    [self setUpLineChart];
    // Do any additional setup after loading the view.
}

- (void)setUpView
{
    _infoView.backgroundColor = [UIColor whiteColor];
    
    
    
    [self.view addSubview:_infoView];
}

- (void)setUpLineChart
{
    //For Line Chart
    PNLineChart * lineChart = [[PNLineChart alloc] initWithFrame:CGRectMake(0, 40, ScreenWidth - 16, _chartView.frame.size.height - 40)];
    lineChart.backgroundColor = [UIColor whiteColor];
    [lineChart setShowYGridLines:YES];
    [lineChart setYLabelNum:YES];
    [lineChart setShowGenYLabels:YES];
    [lineChart setThousandsSeparator:YES];
    lineChart.showCoordinateAxis = YES;
    lineChart.xLabelFont = [UIFont systemFontOfSize:10.0f];
    lineChart.xLabelColor = [UIColor lightGrayColor];
    lineChart.yLabelFont = [UIFont systemFontOfSize:10.0f];
    lineChart.yLabelColor = [UIColor lightGrayColor];
    [lineChart setXLabels:@[@"Oct 14-20",@"Oct 21-27",@"Oct 28-Nov 3",@"Nov 4-10",@"Nov 11-17",@"nov 18-24"]];
    [lineChart setYLabels:@[@"10",@"20",@"30",@"40",@"50"]];
    // Line Chart No.1
    NSArray * data01Array = @[@10, @20, @40, @30, @50, @10];
    PNLineChartData *data01 = [PNLineChartData new];
    data01.color = PNFreshGreen;
    data01.inflexionPointStyle = PNLineChartPointStyleCircle;
    data01.itemCount = lineChart.xLabels.count;
    data01.getData = ^(NSUInteger index) {
        CGFloat yValue = [data01Array[index] floatValue];
        return [PNLineChartDataItem dataItemWithY:yValue];
    };

    lineChart.chartData = @[data01];
    [lineChart strokeChart];
    [_chartView addSubview:lineChart];
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
