//
//  BaseRequest.h
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <Foundation/Foundation.h>
@interface BaseRequest : NSObject
@property(copy) void (^_Nullable completionHandler)(BaseRequest *_Nonnull task, _Nullable id responseObj, NSError *_Nullable error);

@property(nonatomic, assign) Class _Nonnull responseModelClass;

- (NSString *_Nullable)description;
@end
