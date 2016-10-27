//
//  GetTagIndexResponse.h
//  Blog
//
//  Created by huaqing chen on 10/25/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseResponse.h"
#import "TagModel.h"
@interface GetTagIndexResponse : BaseResponse
@property NSArray<TagModel *> *result;
-(NSString *)description;
@end
