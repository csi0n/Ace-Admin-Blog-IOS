//
//  DetailViewController.m
//  Blog
//
//  Created by huaqing chen on 10/17/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "DetailViewController.h"
#import "ArticleModel.h"
#import "ImageLoadHelper.h"
#import "HtmlUtils.h"
#import "BLKFlexibleHeightBar.h"
#import "SquareCashStyleBehaviorDefiner.h"
#import "Config.h"
#import "MBProgressHUD.h"
#import "CommentsViewController.h"
#import "MainNavControllerViewController.h"
@interface DetailViewController ()<UIWebViewDelegate>
@property (weak, nonatomic) IBOutlet UIWebView *webview;
@property MBProgressHUD *hub;
@end

@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
    _hub=[MBProgressHUD showHUDAddedTo:self.view animated:YES];
    _hub.mode=MBProgressHUDModeIndeterminate;
    _hub.labelText=@"加载中...";
    
    BLKFlexibleHeightBar *myBar = [[BLKFlexibleHeightBar alloc] initWithFrame:CGRectMake(0.0, 0.0, self.view.frame.size.width, 250.0)];
    myBar.minimumBarHeight = 60.0;
    myBar.maximumBarHeight=250.0;
    
    
    
    myBar.backgroundColor = THEME_COLOR;
    
    myBar.behaviorDefiner = [SquareCashStyleBehaviorDefiner new];
    _webview.scrollView.delegate=(id<UIScrollViewDelegate>)myBar.behaviorDefiner;
    [myBar.behaviorDefiner addSnappingPositionProgress:0.0 forProgressRangeStart:0.0 end:0.5];
    [myBar.behaviorDefiner addSnappingPositionProgress:1.0 forProgressRangeStart:0.5 end:1.0];
    
    
    
    UIImageView *back=[[UIImageView alloc]initWithImage:[UIImage imageNamed:@"bg"]];
    back.frame=CGRectMake(0, 0, _webview.frame.size.width, 250);
    if (_article.thumb.length>0) {
        [ImageLoadHelper loadWithImageUrl:[NSString stringWithFormat:@"http://img.csi0n.com/%@",_article.thumb] imageView:back];
    }
    
    [myBar addSubview:back];
    
    
    
    UILabel *label = [[UILabel alloc] init];
    label.text = _article.title;
    label.textColor = [UIColor whiteColor];
    [label sizeToFit];
    [myBar addSubview:label];
    
    
    [self.view addSubview:myBar];
    
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *initialLayoutAttributes = [BLKFlexibleHeightBarSubviewLayoutAttributes new];
    initialLayoutAttributes.size = label.frame.size;
    initialLayoutAttributes.center = CGPointMake(label.frame.size.width/2+10,230);
    
    
    // This is what we want the bar to look like at its maximum height (progress == 0.0)
    [label addLayoutAttributes:initialLayoutAttributes forProgress:0.0];
    
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *midLlayoutAttributes=[[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] initWithExistingLayoutAttributes:initialLayoutAttributes];
    midLlayoutAttributes.center=CGPointMake(label.frame.size.width/2+30,100);
    [label addLayoutAttributes:midLlayoutAttributes forProgress:0.6];
    
    
    
    // Create a final set of layout attributes based on the same values as the initial layout attributes
    BLKFlexibleHeightBarSubviewLayoutAttributes *finalLayoutAttributes = [[BLKFlexibleHeightBarSubviewLayoutAttributes alloc] initWithExistingLayoutAttributes:midLlayoutAttributes];
    finalLayoutAttributes.center=CGPointMake(label.frame.size.width/2+50, 40);
    
    // This is what we want the bar to look like at its minimum height (progress == 1.0)
    [label addLayoutAttributes:finalLayoutAttributes forProgress:1.0];
    
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *initImageLayoutAttributes=[BLKFlexibleHeightBarSubviewLayoutAttributes new];
    initImageLayoutAttributes.size=back.frame.size;
    initImageLayoutAttributes.center=CGPointMake(CGRectGetMidX(myBar.bounds), CGRectGetMidY(myBar.bounds)+10.0);
    [back addLayoutAttributes:initImageLayoutAttributes forProgress:0.0];
    
    BLKFlexibleHeightBarSubviewLayoutAttributes *finalImageLayoutAttributes=[[BLKFlexibleHeightBarSubviewLayoutAttributes alloc]
                                                                             initWithExistingLayoutAttributes:initImageLayoutAttributes];
    finalImageLayoutAttributes.alpha=0.0;
    CGAffineTransform imagetranslation = CGAffineTransformMakeTranslation(0, 0);
    CGAffineTransform imgescale = CGAffineTransformMakeTranslation(0, -250);
    finalImageLayoutAttributes.transform = CGAffineTransformConcat( imagetranslation,imgescale);
    [back addLayoutAttributes:finalImageLayoutAttributes forProgress:1.0];
    
                                                                            
    
    UIButton *closeBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    closeBtn.frame=CGRectMake(10, 25, 30, 30);
    closeBtn.tintColor=[UIColor whiteColor];
    [closeBtn setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
    [closeBtn addTarget:self action:@selector(close:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:closeBtn];
    
    
    UIButton *commentBtn=[UIButton buttonWithType:UIButtonTypeCustom];
    commentBtn.frame=CGRectMake(self.view.frame.size.width-45,25,30,30);
    commentBtn.tintColor=[UIColor whiteColor];
    [commentBtn setImage:[UIImage imageNamed:@"ic_comment"] forState:UIControlStateNormal];
    [commentBtn addTarget:self action:@selector(comments:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:commentBtn];
    
    _webview.scrollView.contentInset = UIEdgeInsetsMake(230, 0, 0, 0);
    _webview.delegate=self;
    [_webview loadHTMLString:[[[HtmlUtils alloc] init] createHtmlData:_article.content cssUrl:_article.css] baseURL:nil];

}

- (void)webViewDidStartLoad:(UIWebView *)webView{
    
}
- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.hub setLabelText:@"加载完成"];
    [self.hub hide:YES];
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
    [self.hub setLabelText:@"加载失败"];
    [self.hub hide:YES];
}

-(void)close:(id)sender{
    [self dismissViewControllerAnimated:YES completion:nil];
}
-(void)comments:(id)sender{
    
    UIStoryboard *story=[UIStoryboard storyboardWithName:@"Detail" bundle:[NSBundle mainBundle]];
    
    MainNavControllerViewController *nav=[story instantiateViewControllerWithIdentifier:@"comments"];
    CommentsViewController *comments=nav.viewControllers[0];
    comments.artile=self.article;
    [self showDetailViewController:nav sender:self];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
@end
