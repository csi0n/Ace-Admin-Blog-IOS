//
//  MainTabContentViewController.h
//  Blog
//
//  Created by huaqing chen on 10/17/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "ViewController.h"
#import "CateModel.h"
@interface MainTabContentViewController : ViewController
@property CateModel *cate;
@property (strong, nonatomic)  UITableView *table;
@property (strong,nonatomic) UILabel *label;
@end
