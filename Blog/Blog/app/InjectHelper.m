//
//  InjectHelper.m
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "InjectHelper.h"
#import "BlogApi.h"
#import "BlogApiImpl.h"
@implementation InjectHelper


+(id<BlogApi>)getBlogApi{
    return [[BlogApiImpl alloc]init];
}


@end
