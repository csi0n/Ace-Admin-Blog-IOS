//
//  BaseResponse.h
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseResponse : NSObject
@property int status;
@property NSString *msg;
-(NSString *)description;
@end
