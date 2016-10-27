//
//  SearchViewController.m
//  Blog
//
//  Created by huaqing chen on 10/26/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "SearchViewController.h"
#import "GetArticleSearchResponse.h"
#import "UITableView+EmptyData.h"
#import "ArticleModel.h"
#import "TagModel.h"
#import "MainTabContentCellTableViewCell.h"
#import "ImageLoadHelper.h"
#import "CFFlowButtonView.h"
#import "Masonry.h"
#import "DetailViewController.h"
#import "GetArticleSearchRequest.h"
#import "InjectHelper.h"
@interface SearchViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchBarDelegate>
@property GetArticleSearchResponse *response;
@end

@implementation SearchViewController
- (IBAction)back:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    _table.separatorStyle = UITableViewCellSelectionStyleNone;
    _table.delegate=self;
    _table.dataSource=self;
    _searchBar.delegate=self;
}

-(void)getRequest:(NSString *)key{
    GetArticleSearchRequest *request=[GetArticleSearchRequest requestWithKey:key];
    request.responseModelClass=[GetArticleSearchResponse class];
    request.completionHandler=^(BaseRequest *task,id responseObj, NSError *error){
        if (!error) {
            GetArticleSearchResponse *response=responseObj;
            self.response=response;
            [self.table reloadData];
        }
    };
    [[InjectHelper getBlogApi] GetArticleSearchRequest:request];
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    [tableView tableViewDisplayWitMsg:@"无数据" ifNecessaryForRowCount:[[self.response result] count]];
    return [[self.response result] count];
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
    ArticleModel *article=self.response.result[indexPath.row];
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
    ArticleModel *article=self.response.result[indexPath.row];
    DetailViewController *detail=[[DetailViewController alloc] init];
    detail.article=article;
    [self showDetailViewController:detail sender:nil];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length>0) {
        [self getRequest:searchText];
    }
}

@end
