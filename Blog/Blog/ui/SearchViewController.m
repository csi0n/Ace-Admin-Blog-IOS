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
    _table.backgroundColor=[UIColor groupTableViewBackgroundColor];
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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *reuseIdentifier=@"cell";
    MainTabContentCellTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseIdentifier];
    if (!cell) {
        cell=[[[NSBundle mainBundle]loadNibNamed:@"MainTabContentCellTableViewCell" owner:nil options:nil]firstObject];
    }
    [cell setArticle:self.response.result[indexPath.row]];
    tableView.rowHeight = cell.frame.size.height;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    ArticleModel *article=self.response.result[indexPath.row];
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Detail" bundle:[NSBundle mainBundle]];
    DetailViewController *controller=[story instantiateViewControllerWithIdentifier:@"detail"];
    controller.article=article;
    [self showDetailViewController:controller sender:self];
}


- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText{
    if (searchText.length>0) {
        [self getRequest:searchText];
    }
}

@end
