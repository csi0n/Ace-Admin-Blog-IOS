//
//  GetArticleSearchRequest.m
//  Blog
//
//  Created by huaqing chen on 10/26/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "GetArticleSearchRequest.h"

@implementation GetArticleSearchRequest
-(instancetype)initWithKey:(NSString*)key{
    if (self=[super init]) {
        self.key=key;
    }
    return self;
}
+(instancetype)requestWithKey:(NSString *)key{
    return [[self alloc] initWithKey:key];
}
- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.key=%@", self.key];
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
