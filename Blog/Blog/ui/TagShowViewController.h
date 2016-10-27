//
//  TagShowViewController.h
//  Blog
//
//  Created by huaqing chen on 10/25/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "ViewController.h"
#import "TagModel.h"
@interface TagShowViewController : ViewController
@property TagModel *tag;
@property (strong, nonatomic)  UITableView *table;
@end
