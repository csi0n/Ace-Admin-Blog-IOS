//
//  CommentModel.h
//  Blog
//
//  Created by huaqing chen on 10/28/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseModel.h"

@interface CommentModel : BaseModel
@property NSString *post_id;
@property NSString *thread_id;
@property NSString *thread_key;
@property NSString *author_id;
@property NSString *author_key;
@property NSString *author_name;
@property NSString *author_email;
@property NSString *author_url;
@property NSString *ip;
@property NSString *created_at;
@property NSString *message;
@property NSString *status;
@property NSString *type;
@property NSString *parent_id;
@property NSString *agent;
@end
