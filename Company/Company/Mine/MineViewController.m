//
//  MineViewController.m
//  Company
//
//  Created by Zhang on 6/25/16.
//  Copyright © 2016 Zhang. All rights reserved.
//

#import "MineViewController.h"
#import "LoginViewController.h"

@interface MineViewController ()

@end

@implementation MineViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpNavigationBar];
    // Do any additional setup after loading the view.
}

- (void)setUpNavigationBar
{
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"登录" style:UIBarButtonItemStylePlain target:self action:@selector(loginBtnPress:)];
}

- (void)loginBtnPress:(UIBarButtonItem *)sender
{
    UIStoryboard *loginStory = [UIStoryboard storyboardWithName:@"Login" bundle:nil];
    LoginViewController *loginView = [loginStory instantiateViewControllerWithIdentifier:@"LoginViewController"];
    UINavigationController *controller = [[UINavigationController alloc] initWithRootViewController:loginView];
    [self presentViewController:controller animated:YES completion:^{
        
    }];
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
