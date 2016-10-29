//
//  GetCommentListsRequest.h
//  Blog
//
//  Created by huaqing chen on 10/28/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseRequest.h"

@interface GetCommentListsRequest : BaseRequest
@property int articleId;
-(instancetype)initWithArticleId:(int)artileId;
+(instancetype)requestWithArticleId:(int)artileId;
@end
