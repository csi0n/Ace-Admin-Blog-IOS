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
@interface MainViewController ()<MDTabBarViewControllerDelegate>
@property(nonatomic,strong)id <BlogApi> blogApi;
@property(nonatomic,strong)GetHomeIndexResponse *homeResponse;
@end

@implementation MainViewController{
    MDTabBarViewController *tabBarViewController;
}
-(instancetype)init{
    if (self=[super init]) {
        [self initContent];
    }
    return self;
}

-(id)initWithCoder:(NSCoder *)aDecoder{
    if (self=[super initWithCoder:aDecoder]) {
        [self initContent];
    }
    return self;
}

-(void)initContent{
    tabBarViewController = [[MDTabBarViewController alloc] initWithDelegate:self];
    NSArray *names = @[@"IOS",];
    [tabBarViewController setItems:names];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self addChildViewController:tabBarViewController];
    [self.view addSubview:tabBarViewController.view];
    [tabBarViewController didMoveToParentViewController:self];
    UIView *controllerView = tabBarViewController.view;
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
    self.title = @"MDTabBarViewController";
    [self getRequest];
}
-(void)getRequest{
    GetHomeIndexRequest *request=[[GetHomeIndexRequest alloc] init];
    request.responseModelClass=[GetHomeIndexResponse class];
    request.completionHandler=^(BaseRequest *task,id responseObj, NSError *error){
        if (!error) {
            GetHomeIndexResponse *response=responseObj;
            self.homeResponse=response;
            //tabBarViewController=[[MDTabBarViewController alloc] initWithDelegate:self];
            NSMutableArray *MutableArray =[[NSMutableArray alloc]init];
            for (CateModel * cate in response.result) {
                [MutableArray addObject:cate.name];
            }
            [tabBarViewController setItems:MutableArray];
        }
    };
    self.blogApi=[InjectHelper getBlogApi];
    [self.blogApi GetHomeIndexRequest:request];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (UIViewController *)tabBarViewController:(MDTabBarViewController *)viewController viewControllerAtIndex:(NSUInteger)index {
    MainTabContentViewController *controller =[[MainTabContentViewController alloc] init];
    dispatch_async(dispatch_get_main_queue(), ^{
        [controller initWithCate:[self homeResponse].result[index]];
    });
    return controller;
}

- (void)tabBarViewController:(MDTabBarViewController *)viewController didMoveToIndex:(NSUInteger)index {
}
@end
