//
//  BaseViewController.m
//  Company
//
//  Created by Zhang on 6/25/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    if (self. navigationController.viewControllers.count != 1) {
        [self setNavigationBackBtn];
    }
    // Do any additional setup after loading the view.
}

- (void)setNavigationBackBtn
{
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"application_back"] style:UIBarButtonItemStylePlain target:self action:@selector(backBtnPress:)];
}

- (void)backBtnPress:(UIBarButtonItem *)sender
{
    [self.navigationController popViewControllerAnimated:YES];
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
