//
//  BlogApiImpl.m
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BlogApiImpl.h"
#import "AFNetworking.h"
#import "BaseRequest.h"
#import "YYModel.h"
#import "GetHomeIndexRequest.h"
#import "GetTagIndexRequest.h"
#import "GetTagShowRequest.h"
#import "GetArticleSearchRequest.h"
#import "GetCommentListsRequest.h"
@implementation BlogApiImpl{
AFHTTPSessionManager *_manager;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        _manager = [AFHTTPSessionManager manager];
        _manager.requestSerializer = [AFJSONRequestSerializer serializer];
        [_manager.requestSerializer setValue:@"application/json; charset=UTF-8" forHTTPHeaderField:@"Content-Type"];
        [_manager.requestSerializer setValue:@"no-cache" forHTTPHeaderField:@"Cache-Control"];
        [_manager.requestSerializer setValue:@"zhihu" forHTTPHeaderField:@"User-Agent"];
        _manager.responseSerializer = [[AFJSONResponseSerializer alloc] init];
    }
    
    return self;
}

- (void)doHttpGet:(NSString *)url
          success:(void (^)(NSURLSessionDataTask *, id))success
          failure:(void (^)(NSURLSessionDataTask *, NSError *))failure {
    
    [_manager GET:url
       parameters:nil
         progress:nil
          success:success
          failure:failure];
}

- (void (^)(NSURLSessionDataTask *, NSError *))getFailCallback:(BaseRequest *)request {
    void (^failure)(NSURLSessionDataTask *, NSError *) = ^(NSURLSessionDataTask *task, NSError *error) {
    
        if (request.completionHandler) {
            request.completionHandler(request, nil, error);
        }
    };
    return failure;
}

- (void (^)(NSURLSessionDataTask *, id))getSuccessCallback:(BaseRequest *)request {
    void (^success)(NSURLSessionDataTask *, id) = ^(NSURLSessionDataTask *task, id responseObject) {
        if (request.completionHandler) {
            id zhihuResponse = [request.responseModelClass yy_modelWithDictionary:responseObject];
            request.completionHandler(request, zhihuResponse, nil);
        }
    };
    return success;
}

-(void)GetHomeIndexRequest:(GetHomeIndexRequest *)request{
    NSString *url=@"http://www.csi0n.com/api/blog/home";
    void(^success)(NSURLSessionDataTask *,id)=[self getSuccessCallback:request];
    void(^failure)(NSURLSessionDataTask *,NSError *)=[self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

-(void)GetTagIndexRequest:(GetTagIndexRequest *)request{
    NSString *url=@"http://www.csi0n.com/api/blog/tag";
    void(^success)(NSURLSessionDataTask *,id)=[self getSuccessCallback:request];
    void(^failure)(NSURLSessionDataTask *,NSError *)=[self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

-(void)GetTagShowRequest:(GetTagShowRequest *)request{
    NSString *url=@"http://www.csi0n.com/api/blog/tag/%d";
    url=[NSString stringWithFormat:url,request.tagId];
    void(^success)(NSURLSessionDataTask *,id)=[self getSuccessCallback:request];
    void(^failure)(NSURLSessionDataTask *,NSError *)=[self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

-(void)GetArticleSearchRequest:(GetArticleSearchRequest *)request{
    NSString *url=@"http://www.csi0n.com/api/blog/article/search/%@";
    url=[NSString stringWithFormat:url,request.key];
    void(^success)(NSURLSessionDataTask *,id)=[self getSuccessCallback:request];
    void(^failure)(NSURLSessionDataTask *,NSError *)=[self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}

-(void)GetCommentListRequest:(GetCommentListsRequest *)request{
    NSString *url=@"http://www.csi0n.com/api/blog/comments/lists/%d";
    url=[NSString stringWithFormat:url,request.articleId];
    void(^success)(NSURLSessionDataTask *,id)=[self getSuccessCallback:request];
    void(^failure)(NSURLSessionDataTask *,NSError *)=[self getFailCallback:request];
    [self doHttpGet:url success:success failure:failure];
}
@end
