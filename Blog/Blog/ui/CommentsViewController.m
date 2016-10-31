//
//  CommentsViewController.m
//  Blog
//
//  Created by huaqing chen on 10/28/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "CommentsViewController.h"
#import "GetCommentListsRequest.h"
#import "GetCommentResponse.h"
#import "UITableView+EmptyData.h"
#import "InjectHelper.h"
#import "MainTabContentCellTableViewCell.h"
#import "CommentModel.h"
#import <MJRefresh/MJRefreshNormalHeader.h>
#import "MBProgressHUD.h"
#import "CommentsViewCellTableViewCell.h"
@interface CommentsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property GetCommentResponse *response;
@end

@implementation CommentsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _table.separatorStyle = UITableViewCellSelectionStyleNone;
    _table.delegate=self;
    _table.dataSource=self;
    _table.mj_header=[MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self getRequest];
    }];
    _table.backgroundColor=[UIColor groupTableViewBackgroundColor];
    [self getRequest];
}
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

-(void)getRequest{
    MBProgressHUD *hub=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    hub.mode=MBProgressHUDModeIndeterminate;
    hub.labelText=@"加载中...";
    GetCommentListsRequest *request=[GetCommentListsRequest requestWithArticleId:_artile.id];
    request.responseModelClass=[GetCommentResponse class];
    request.completionHandler=^(BaseRequest *task,id responseObj, NSError *error){
        if (!error) {
            GetCommentResponse *response=responseObj;
            self.response=response;
            [self.table reloadData];
            [hub setLabelText:@"加载成功"];
        }else{
            [hub setLabelText:@"加载失败"];
        }
        [hub hide:YES];
        [self.table.mj_header endRefreshing];
    };
    [[InjectHelper getBlogApi] GetCommentListRequest:request];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    [tableView tableViewDisplayWitMsg:@"无数据" ifNecessaryForRowCount:[[self.response result] count]];
    return [[self.response result] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier=@"cell";
    CommentsViewCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"CommentsViewCellTableViewCell" owner:nil options:nil]firstObject];
    }
    [cell setComment:self.response.result[indexPath.row]];
    tableView.rowHeight = cell.frame.size.height;
    return cell;
}


@end
