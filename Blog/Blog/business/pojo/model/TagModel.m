//
//  TagModel.m
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "TagModel.h"

@implementation TagModel
+ (NSDictionary *)modelCustomPropertyMapper {
    return @{
             @"id" : @"id",
             @"name" : @"name",
             @"created_at":@"created_at",
             @"updated_at":@"updated_at"
             };
}


- (NSString *)description {
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.id=%i", self.id];
    [description appendFormat:@", self.name=%@", self.name];
    [description appendFormat:@", self.created_at=%@", self.created_at];
    [description appendFormat:@", self.updated_at=%@", self.updated_at];
    [description appendString:@">"];
    return description;
}
@end
