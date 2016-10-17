//
//  BaseResponse.m
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseResponse.h"

@implementation BaseResponse{
}
+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{
             @"status":@"status",
             @"msg":@"msg"
             };
}
-(NSString *)description{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.status=%i", self.status];
    [description appendFormat:@", self.msg=%@", self.msg];
    [description appendString:@">"];
    return description;
}
@end
