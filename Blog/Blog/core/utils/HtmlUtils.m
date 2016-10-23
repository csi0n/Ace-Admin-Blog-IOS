//
//  HtmlUtils.m
//  Blog
//
//  Created by huaqing chen on 10/23/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "HtmlUtils.h"

@implementation HtmlUtils
-(instancetype)init{
    if (self=[super init]) {
        _HIDE_HEADER_STYLE=@"<style>div.headline{display:none;}</style>";
        _NEEDED_FORMAT_CSS_TAG=@"<link rel=\"stylesheet\" type=\"text/css\" href=\"%@\"/>";
        _NEEDED_FORMAT_JS_TAG=@"<script src=\"%@\"></script>";
        _MIME_TYPE=@"text/html; charset=utf-8";
        _ENCODING=@"utf-8";
        _HTML_HEAD=@"<!DOCTYPE html><meta name=\"viewport\" content=\"width=device-width, initial-scale=1\"><head>%@</head><body>%@";
        _HTML_END=@"</body></html>";
    }
    return self;
}


-(NSString *)createCssTag:(NSString *)url{
    return [NSString stringWithFormat:_NEEDED_FORMAT_CSS_TAG,url];
}
-(NSString *)createCssTags:(NSArray *)urls{
    for (int i=0; i<[urls count]; i++) {
    }
    return nil;
}
-(NSString *)createJsTag:(NSString *)url{
    return [NSString stringWithFormat:_NEEDED_FORMAT_JS_TAG,url];
}
-(NSString *)createJsTags:(NSArray *)urls{
    return nil;
}
-(NSString *)createHtmlData:(NSString *)html cssUrl:(NSString *)url{
    return [NSString stringWithFormat:@"%@ %@",[NSString stringWithFormat:_HTML_HEAD,[self createCssTag:url],html],_HTML_END];
}
@end
