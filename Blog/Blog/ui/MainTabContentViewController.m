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
    _table=[[UITableView alloc]initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-150)];
    _table.separatorStyle = UITableViewCellSelectionStyleNone;
    _table.delegate=self;
    _table.dataSource=self;
    _table.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.table reloadData];
        [_table.mj_header endRefreshing];
    }];
    _table.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self.view addSubview:_table];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [tableView tableViewDisplayWitMsg:@"无数据" ifNecessaryForRowCount:[self.cate.articles count]];
    return [self.cate.articles count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier=@"cell";
    MainTabContentCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MainTabContentCellTableViewCell" owner:nil options:nil]firstObject];
    }
    [cell setArticle:self.cate.articles[indexPath.row]];
    tableView.rowHeight = cell.frame.size.height;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleModel *article=[self cate].articles[indexPath.row];
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Detail" bundle:[NSBundle mainBundle]];
    DetailViewController *controller=[story instantiateViewControllerWithIdentifier:@"detail"];
    controller.article=article;
    [self showDetailViewController:controller sender:self];
}
@end
