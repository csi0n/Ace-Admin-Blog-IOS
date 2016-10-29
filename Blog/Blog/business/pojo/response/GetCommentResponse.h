//
//  GetCommentResponse.h
//  Blog
//
//  Created by huaqing chen on 10/28/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseResponse.h"

@interface GetCommentResponse : BaseResponse
@property NSArray *result;
-(NSString *)description;
@end
