//
//  GetHomeIndexResponse.h
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//
#import <Foundation/Foundation.h>
#import "BaseResponse.h"
#import "CateModel.h"
@interface GetHomeIndexResponse : BaseResponse
@property NSArray<CateModel *> *result;
-(NSString *)description;
@end
