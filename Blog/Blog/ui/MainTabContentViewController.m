//
//  MainTabContentViewController.m
//  Blog
//
//  Created by huaqing chen on 10/17/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "MainTabContentViewController.h"
#import "MainTabContentCellTableViewCell.h"
#import "ArticleModel.h"
#import "TagModel.h"
#import "ImageLoadHelper.h"
#import "DetailViewController.h"
#import <MJRefresh/MJRefreshNormalHeader.h>
#import "UITableView+EmptyData.h"
#import "CFFlowButtonView.h"
#import "Masonry.h"
#import "MainNavControllerViewController.h"
@interface MainTabContentViewController ()<UITableViewDataSource,UITableViewDelegate>
@end
@implementation MainTabContentViewController
- (void)viewDidLoad {
    [super viewDidLoad];
    
    _table=[[UITableView alloc]initWithFrame:self.view.frame];
    _table.separatorStyle = UITableViewCellSelectionStyleNone;
    _table.delegate=self;
    _table.dataSource=self;
    _table.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.table reloadData];
        [_table.mj_header endRefreshing];
    }];
    [self.view addSubview:_table];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [tableView tableViewDisplayWitMsg:@"无数据" ifNecessaryForRowCount:[_cate.articles count]];
    return [_cate.articles count];
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
    ArticleModel *article=_cate.articles[indexPath.row];
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
    ArticleModel *article=[self cate].articles[indexPath.row];
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Detail" bundle:[NSBundle mainBundle]];
    DetailViewController *controller=[story instantiateViewControllerWithIdentifier:@"detail"];
    controller.article=article;
    [self showDetailViewController:controller sender:self];
    
    
    
    
//    ArticleModel *article=[self cate].articles[indexPath.row];
//    DetailViewController *detail=[[DetailViewController alloc] init];
//    detail.article=article;
//    [self showDetailViewController:detail sender:nil];
}
@end
