//
//  TagViewController.m
//  Blog
//
//  Created by huaqing chen on 10/24/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "TagViewController.h"
#import "Config.h"
#import "BlogApi.h"
#import "GetTagIndexResponse.h"
#import "GetTagIndexRequest.h"
#import "BlogApi.h"
#import "InjectHelper.h"
#import "CFFlowButtonView.h"
#import "Masonry.h"
#import "TagShowViewController.h"
#import "MainNavControllerViewController.h"
#import "MBProgressHUD.h"
@interface TagViewController ()<clickTagDelegate>
@property(nonatomic,strong)id <BlogApi> blogApi;
@property(nonatomic,strong)GetTagIndexResponse *tagIndexResponse;
@end

@implementation TagViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor=[UIColor whiteColor];
    [self getRequest];
}
-(void)getRequest{
    MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hub.mode=MBProgressHUDModeIndeterminate;
    hub.labelText=@"加载中...";
    GetTagIndexRequest *request=[[GetTagIndexRequest alloc] init];
    request.responseModelClass=[GetTagIndexResponse class];
    request.completionHandler=^(BaseRequest *task,id responseObj, NSError *error){
        if (!error) {
            GetTagIndexResponse *response=responseObj;
            self.tagIndexResponse=response;
            CFFlowButtonView *flowButtonView = [[CFFlowButtonView alloc] initWithButtonList:[self addTags:response.result]];
            flowButtonView.delegate=self;
            [self.view addSubview:flowButtonView];
            [flowButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.top.equalTo(self.view.mas_top).offset(70);
                make.left.equalTo(self.view.mas_left);
                make.right.equalTo(self.view.mas_right);
                make.bottom.equalTo(self.view.mas_bottom);
            }];
            [hub setLabelText:@"加载成功"];
        }else{
            [hub setLabelText:@"加载失败"];
            
        }
        [hub hide:YES];
        
    };
    [[InjectHelper getBlogApi] GetTagIndexRequest:request];
}


-(NSMutableArray *)addTags:(NSArray *)tags{
    NSMutableArray *arrs=[NSMutableArray array];
    for (int i=0; i<[tags count]; i++) {
        TagModel *tag=tags[i];
        UIButton *button=[[[NSBundle mainBundle] loadNibNamed:@"MyButton" owner:self options:nil] lastObject];
        [button setTitle:tag.name forState:UIControlStateNormal];
        [arrs addObject:button];
    }
    return arrs;
}

-(void)click:(NSString *)string tag:(NSInteger)tag{
    for (int i=0; i<_tagIndexResponse.result.count; i++) {
        if (_tagIndexResponse.result[i].name==string) {
            UIStoryboard *story=[UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            MainNavControllerViewController *nav=[story instantiateViewControllerWithIdentifier:@"showTag"];
            TagShowViewController *controller=nav.viewControllers[0];
            controller.tag=_tagIndexResponse.result[i];
            [self showDetailViewController:nav sender:self];
        }
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)viewWillAppear:(BOOL)animated{
    
}
@end
