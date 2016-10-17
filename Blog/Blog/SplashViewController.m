//
//  SplashViewController.m
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "SplashViewController.h"
#import "GetHomeIndexRequest.h"
#import "GetHomeIndexResponse.h"
#import "BlogApi.h"
#import "InjectHelper.h"
#import "MainViewController.h"
@interface SplashViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *adImageView;
@property(nonatomic,strong)id <BlogApi> blogApi;
@end

@implementation SplashViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setup];
    // Do any additional setup after loading the view.
}


-(void)setup{
    self.navigationController.navigationBar.hidden=YES;
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @1.0F;
    scaleAnimation.toValue = @1.1F;
    scaleAnimation.autoreverses = NO;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.duration = 3;
    [_adImageView.layer addAnimation:scaleAnimation forKey:@"transform.scale"];
    [self.navigationController pushViewController:[[MainViewController alloc] init] animated:YES];
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
