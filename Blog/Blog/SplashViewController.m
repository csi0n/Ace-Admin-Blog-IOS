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
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    scaleAnimation.fromValue = @1.0F;
    scaleAnimation.toValue = @1.1F;
    scaleAnimation.autoreverses = NO;
    scaleAnimation.fillMode = kCAFillModeForwards;
    scaleAnimation.duration = 3;
    [_adImageView.layer addAnimation:scaleAnimation forKey:@"transform.scale"];
    [self.navigationController pushViewController:[[MainViewController alloc] init] animated:NO];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
