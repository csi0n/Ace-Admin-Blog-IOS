//
//  Header.h
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GetHomeIndexRequest;
@class GetTagIndexRequest;
@class GetTagShowRequest;
@class GetArticleSearchRequest;
@class GetCommentListsRequest;
@protocol BlogApi <NSObject>

-(void)GetHomeIndexRequest:(GetHomeIndexRequest *)request;

-(void)GetTagIndexRequest:(GetTagIndexRequest *)request;

-(void)GetTagShowRequest:(GetTagShowRequest *)request;

-(void)GetArticleSearchRequest:(GetArticleSearchRequest *)request;

-(void)GetCommentListRequest:(GetCommentListsRequest *)request;
@end
