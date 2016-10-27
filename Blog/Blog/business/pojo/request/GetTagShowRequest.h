//
//  GetTagShowRequest.h
//  Blog
//
//  Created by huaqing chen on 10/25/16.
//  Copyright © 2016 csi0n. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseRequest.h"

@interface GetTagShowRequest : BaseRequest
@property int tagId;
-(instancetype)initWithTagId:(int)tagId;
+(instancetype)requestWithTagId:(int)tagId;
@end
