//
//  CateModel.m
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "CateModel.h"

@implementation CateModel{
}
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"id" : @"id",
             @"name" : @"name",
             @"pid":@"pid",
             @"sort":@"sort",
             @"created_at":@"created_at",
             @"updated_at":@"updated_at"
             };
}


+ (NSDictionary *)modelContainerPropertyGenericClass {
    return @{
             @"articles" : [ArticleModel class],
             };
}

- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.id=%i", self.id];
    [description appendFormat:@", self.name=%@", self.name];
    [description appendFormat:@", self.pid=%i", self.pid];
    [description appendFormat:@", self.sort=%i", self.sort];
    [description appendFormat:@", self.created_at=%@", self.created_at];
    [description appendFormat:@", self.updated_at=%@", self.updated_at];
    [description appendString:@">"];
    return description;
}
@end
