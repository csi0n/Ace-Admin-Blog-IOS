//
//  GetTagShowRequest.m
//  Blog
//
//  Created by huaqing chen on 10/25/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "GetTagShowRequest.h"

@implementation GetTagShowRequest
-(instancetype)initWithTagId:(int)tagId{
    if (self=[super init]) {
        self.tagId=tagId;
    }
    return self;
}
+(instancetype)requestWithTagId:(int)tagId{
    return [[self alloc] initWithTagId:tagId];
}
- (NSString *)description {
    NSMutableString *description = [NSMutableString string];
    [description appendFormat:@"self.tagId=%i", self.tagId];
    
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
