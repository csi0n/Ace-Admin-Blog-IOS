//
//  BaseRequest.m
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseRequest.h"

@implementation BaseRequest{}
-(NSString *)description{
    NSMutableString *description = [NSMutableString stringWithFormat:@"<%@: ", NSStringFromClass([self class])];
    [description appendFormat:@"self.completionHandler=%p", self.completionHandler];
    [description appendFormat:@", self.responseModelClass=%@", self.responseModelClass];
    [description appendString:@">"];
    return description;
}

@end
