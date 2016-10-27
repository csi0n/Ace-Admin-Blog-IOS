//
//  TagShowViewController.m
//  Blog
//
//  Created by huaqing chen on 10/25/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "TagShowViewController.h"
#import "GetTagShowRequest.h"
#import "GetTagShowResponse.h"
#import "BlogApi.h"
#import "InjectHelper.h"
#import <MJRefresh/MJRefreshNormalHeader.h>
#import "ArticleModel.h"
#import "MainTabContentCellTableViewCell.h"
#import "ImageLoadHelper.h"
#import "CFFlowButtonView.h"
#import "UITableView+EmptyData.h"
#import "Masonry.h"
#import "DetailViewController.h"
#import "MainNavControllerViewController.h"
#import "MBProgressHUD.h"
@interface TagShowViewController ()<UITableViewDataSource,UITableViewDelegate>
@property GetTagShowResponse *tagShow;
@property (weak, nonatomic) IBOutlet UINavigationItem *titleBar;
@property(nonatomic,strong)id <BlogApi> blogApi;
@end

@implementation TagShowViewController
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    _titleBar.title=_tag.name;
    _table=[[UITableView alloc]initWithFrame:self.view.frame];
    _table.separatorStyle = UITableViewCellSelectionStyleNone;
    _table.delegate=self;
    _table.dataSource=self;
    _table.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getRequest];
    }];
    [self.view addSubview:_table];
    [self getRequest];
}
-(void)getRequest{
    MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hub.mode=MBProgressHUDModeIndeterminate;
    hub.labelText=@"加载中...";
    GetTagShowRequest *request=[GetTagShowRequest requestWithTagId:_tag.id];
    request.responseModelClass=[GetTagShowResponse class];
    request.completionHandler=^(BaseRequest *task,id responseObj, NSError *error){
        if (!error) {
            GetTagShowResponse *response=responseObj;
            self.tagShow=response;
            [self.table reloadData];
            [self.table.mj_header endRefreshing];
            [hub setLabelText:@"加载成功"];
        }else{
            [hub setLabelText:@"加载失败"];
        }
        [hub hide:YES];
    };
    [[InjectHelper getBlogApi] GetTagShowRequest:request];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [tableView tableViewDisplayWitMsg:@"无数据" ifNecessaryForRowCount:[[self.tagShow result] count]];
    return [[self.tagShow result] count];
}

-(NSMutableArray *)addTags:(ArticleModel *)article{
    NSMutableArray *arrs=[NSMutableArray array];
    for (int i=0; i<[article.tags count]; i++) {
        TagModel *tag=article.tags[i];
        UIButton *button=[[[NSBundle mainBundle] loadNibNamed:@"MyButton" owner:self options:nil] lastObject];
        [button setTitle:tag.name forState:UIControlStateNormal];
        [arrs addObject:button];
    }
    return arrs;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *mainTabContentCell = @"MainTabContentCellTableViewCell";
    MainTabContentCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:mainTabContentCell];
    if (nil==cell) {
        NSArray *nib = [[NSBundle mainBundle] loadNibNamed:mainTabContentCell owner:self options:nil];
        cell=[nib objectAtIndex:0];
    }
    ArticleModel *article=self.tagShow.result[indexPath.row];
    if (article.thumb.length>0) {
        [ImageLoadHelper loadWithImageUrl:[NSString stringWithFormat:@"http://img.csi0n.com/%@",article.thumb] imageView:cell.head];
    }
    cell.title.text=article.title;
    cell.content.text=article.describe;
    CFFlowButtonView *flowButtonView = [[CFFlowButtonView alloc] initWithButtonList:[self addTags:article]];
    [cell.tags addSubview:flowButtonView];
    [flowButtonView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(cell.tags.mas_top);
        make.left.equalTo(cell.tags.mas_left);
        make.right.equalTo(cell.tags.mas_right);
        make.bottom.equalTo(cell.tags.mas_bottom);
    }];
    tableView.rowHeight = cell.frame.size.height;
    cell.backgroundColor=[UIColor whiteColor];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleModel *article=self.tagShow.result[indexPath.row];
    DetailViewController *detail=[[DetailViewController alloc] init];
    detail.article=article;
    [self showDetailViewController:detail sender:nil];
}




@end
