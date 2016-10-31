//
//  HomeViewController.m
//  Blog
//
//  Created by huaqing chen on 10/24/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "HomeViewController.h"
#import "MDTabBarViewController.h"
#import "MainTabContentViewController.h"
#import "GetHomeIndexRequest.h"
#import "GetHomeIndexResponse.h"
#import "CateModel.h"
#import "BlogApi.h"
#import "InjectHelper.h"
#import "Config.h"
#import "MBProgressHUD.h"
@interface HomeViewController ()<MDTabBarViewControllerDelegate>
@property(nonatomic,strong)id <BlogApi> blogApi;
@property(nonatomic,strong)GetHomeIndexResponse *homeResponse;
@property(nonatomic,strong)MDTabBarViewController *tabBarViewController;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self getRequest];
}
-(void)getRequest{
    MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hub.mode=MBProgressHUDModeIndeterminate;
    hub.labelText=@"加载中...";
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
            [hub setLabelText:@"加载成功"];
        }else{
             [hub setLabelText:@"加载失败"];
        }
        [hub hide:YES];
    };
    [[InjectHelper getBlogApi] GetHomeIndexRequest:request];
}

-(void)initTabBar:(NSMutableArray *)names{
    _tabBarViewController = [[MDTabBarViewController alloc] initWithDelegate:self];
    _tabBarViewController.tabBar.backgroundColor=THEME_COLOR;
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

- (void)tabBarViewController:(MDTabBarViewController *)viewController didMoveToIndex:(NSUInteger)index {
}

@end
