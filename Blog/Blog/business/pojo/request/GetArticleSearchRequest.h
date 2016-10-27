//
//  GetArticleSearchRequest.h
//  Blog
//
//  Created by huaqing chen on 10/26/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseRequest.h"

@interface GetArticleSearchRequest : BaseRequest
@property NSString *key;
-(instancetype)initWithKey:(NSString*)key;
+(instancetype)requestWithKey:(NSString *)key;
@end
