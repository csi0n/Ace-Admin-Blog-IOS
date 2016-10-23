//
//  MainViewController.m
//  Blog
//
//  Created by huaqing chen on 10/17/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "MainViewController.h"
#import "MDTabBarViewController.h"
#import "MainTabContentViewController.h"
#import "GetHomeIndexRequest.h"
#import "GetHomeIndexResponse.h"
#import "CateModel.h"
#import "BlogApi.h"
#import "InjectHelper.h"
#import "Config.h"
#import "BLKFlexibleHeightBar.h"
#import "SquareCashStyleBehaviorDefiner.h"
@interface MainViewController ()<MDTabBarViewControllerDelegate>
@property(nonatomic,strong)id <BlogApi> blogApi;
@property(nonatomic,strong)GetHomeIndexResponse *homeResponse;
@property(nonatomic,strong)MDTabBarViewController *tabBarViewController;
@property(nonatomic,strong)BLKFlexibleHeightBar *myBar;
@end
@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title=@"Blog";
    
    
    
    
    self.view.backgroundColor=[UIColor whiteColor];
    [self getRequest];
}
-(void)getRequest{
    GetHomeIndexRequest *request=[[GetHomeIndexRequest alloc] init];
    request.responseModelClass=[GetHomeIndexResponse class];
    request.completionHandler=^(BaseRequest *task,id responseObj, NSError *error){
        if (!error) {
            GetHomeIndexResponse *response=responseObj;
            self.homeResponse=response;
            NSMutableArray *MutableArray =[[NSMutableArray alloc]init];
            for (CateModel * cate in response.result) {
                [MutableArray addObject:cate.name];
            }
            [self initTabBar:MutableArray];
        }
    };
    self.blogApi=[InjectHelper getBlogApi];
    [self.blogApi GetHomeIndexRequest:request];
}

-(void)initTabBar:(NSMutableArray *)names{
    _tabBarViewController = [[MDTabBarViewController alloc] initWithDelegate:self];
    [_tabBarViewController setItems:names];
    [self addChildViewController:_tabBarViewController];
    [self.view addSubview:_tabBarViewController.view];
    [_tabBarViewController didMoveToParentViewController:self];
    UIView *controllerView = _tabBarViewController.view;
    id<UILayoutSupport> rootTopLayoutGuide = self.topLayoutGuide;
    id<UILayoutSupport> rootBottomLayoutGuide = self.bottomLayoutGuide;
    NSDictionary *viewsDictionary = NSDictionaryOfVariableBindings(
                                                                   rootTopLayoutGuide, rootBottomLayoutGuide, controllerView);
    
    [self.view
     addConstraints:[NSLayoutConstraint
                     constraintsWithVisualFormat:@"V:[rootTopLayoutGuide]["
                     @"controllerView][" @"rootBottomLayoutGuide]"
                     options:0
                     metrics:nil
                     views:viewsDictionary]];
    [self.view
     addConstraints:[NSLayoutConstraint
                     constraintsWithVisualFormat:@"H:|[controllerView]|"
                     options:0
                     metrics:nil
                     views:viewsDictionary]];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIViewController *)tabBarViewController:(MDTabBarViewController *)viewController viewControllerAtIndex:(NSUInteger)index {
    MainTabContentViewController *controller =[[MainTabContentViewController alloc] init];
    controller.cate=[self homeResponse].result[index];
    return controller;
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=NO;
    self.navigationItem.hidesBackButton=YES;
}
- (void)tabBarViewController:(MDTabBarViewController *)viewController didMoveToIndex:(NSUInteger)index {
}
@end
