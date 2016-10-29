//
//  CommentsViewController.h
//  Blog
//
//  Created by huaqing chen on 10/28/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "ViewController.h"
#import "ArticleModel.h"
@interface CommentsViewController : ViewController
@property ArticleModel *artile;
@property (weak, nonatomic) IBOutlet UITableView *table;
@end
