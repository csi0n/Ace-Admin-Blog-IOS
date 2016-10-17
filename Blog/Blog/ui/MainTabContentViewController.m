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
#import "ImageLoadHelper.h"
@interface MainTabContentViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *table;
@property(weak,nonatomic)CateModel *cate;
@end

@implementation MainTabContentViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _table=[[UITableView alloc]initWithFrame:self.view.frame];
    _table.delegate=self;
    _table.dataSource=self;
    [self.view addSubview:_table];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)initWithCate:(CateModel *)cate{
    self.cate=cate;
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.cate.articles count]==nil?0:[self.cate.articles count];
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
    if (article.thumb!=nil) {
        [ImageLoadHelper loadWithImageUrl:[NSString stringWithFormat:@"http://img.csi0n.com/%@",article.thumb] imageView:cell.head];
    }
    cell.title.text=article.title;
    cell.content.text=article.content;
    tableView.rowHeight = cell.frame.size.height;
    return cell;
}
@end
