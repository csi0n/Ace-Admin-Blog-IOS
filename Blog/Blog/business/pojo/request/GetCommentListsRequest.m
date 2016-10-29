//
//  GetCommentListsRequest.m
//  Blog
//
//  Created by huaqing chen on 10/28/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "GetCommentListsRequest.h"

@implementation GetCommentListsRequest
-(instancetype)initWithArticleId:(int)artileId{
    if (self=[super init]) {
        self.articleId=artileId;
    }
    return self;
}

+(instancetype)requestWithArticleId:(int)artileId{
    return [[self alloc] initWithArticleId:artileId];
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.articleId=%i", self.articleId];
    
    NSMutableString *superDescription = [[super description] mutableCopy];
    NSUInteger length = [superDescription length];
    
    if (length > 0 && [superDescription characterAtIndex:length - 1] == '>') {
        [superDescription insertString:@", " atIndex:length - 1];
        [superDescription insertString:description atIndex:length + 1];
        return superDescription;
    }
    else {
        return [NSString stringWithFormat:@"<%@: %@>", NSStringFromClass([self class]), description];
    }
}
@end
