//
//  InjectHelper.h
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BlogApi.h"
@interface InjectHelper : NSObject
+(id<BlogApi>)getBlogApi;
@end
