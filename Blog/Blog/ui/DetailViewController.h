//
//  DetailViewController.h
//  Blog
//
//  Created by huaqing chen on 10/17/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "ViewController.h"
#import "ArticleModel.h"
@interface DetailViewController : ViewController
@property ArticleModel *article;
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@end
