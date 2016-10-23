//
//  HtmlUtils.h
//  Blog
//
//  Created by huaqing chen on 10/23/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HtmlUtils : NSObject
@property NSString *HIDE_HEADER_STYLE;
@property NSString *NEEDED_FORMAT_CSS_TAG;
@property NSString *NEEDED_FORMAT_JS_TAG;
@property NSString *MIME_TYPE;
@property NSString *ENCODING;
@property NSString *HTML_HEAD;
@property NSString *HTML_END;
-(NSString *)createCssTag:(NSString *)url;
-(NSString *)createCssTags:(NSArray *)urls;
-(NSString *)createJsTag:(NSString *)url;
-(NSString *)createJsTags:(NSArray *)urls;
-(NSString *)createHtmlData:(NSString *)html cssUrl:(NSString *)url;
@end
