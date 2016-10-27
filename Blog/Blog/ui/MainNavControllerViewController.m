//
//  MainNavControllerViewController.m
//  Blog
//
//  Created by huaqing chen on 10/25/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "MainNavControllerViewController.h"
#import "Config.h"
@interface MainNavControllerViewController ()

@end

@implementation MainNavControllerViewController


+ (void)initialize
{
    // 设置导航栏的主题
    UINavigationBar *navBar = [UINavigationBar appearance];
    [navBar setBarTintColor:THEME_COLOR];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
