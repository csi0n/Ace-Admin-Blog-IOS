//
//  ArticleModel.m
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "ArticleModel.h"
#import "TagModel.h"
@implementation ArticleModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"id" : @"id",
             @"thumb" : @"thumb",
             @"title" : @"title",
             @"describe":@"describe",
             @"css":@"css",
             @"content" : @"content",
             @"content_md" : @"content_md",
             @"user_id":@"user_id",
             @"cate_id":@"cate_id",
             @"sort":@"sort",
             @"created_at":@"created_at",
             @"updated_at":@"updated_at"
             };
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"tags" : [TagModel class],
             };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.id=%i", self.id];
    [description appendFormat:@", self.thumb=%@", self.thumb];
    [description appendFormat:@", self.title=%@", self.title];
    [description appendFormat:@", self.describe=%@",self.describe];
    [description appendFormat:@", self.css=%@",self.css];
    [description appendFormat:@", self.content=%@", self.content];
    [description appendFormat:@", self.content_md=%@", self.content_md];
    [description appendFormat:@", self.user_id=%i", self.user_id];
    [description appendFormat:@", self.cate_id=%i", self.cate_id];
    [description appendFormat:@", self.sort=%i", self.sort];
    [description appendFormat:@", self.created_at=%@", self.created_at];
    [description appendFormat:@", self.updated_at=%@", self.updated_at];
    [description appendFormat:@", self.tags=%@", self.tags];
    [description appendString:@">"];
    return description;
}
@end
