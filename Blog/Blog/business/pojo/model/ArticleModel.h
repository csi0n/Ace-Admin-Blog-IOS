//
//  ArticleModel.h
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseModel.h"
#import <Foundation/Foundation.h>
@interface ArticleModel : BaseModel
@property int id;
@property NSString *thumb;
@property NSString *describe;
@property NSString *title;
@property NSString *content;
@property NSString *css;
@property NSString *content_md;
@property int user_id;
@property int cate_id;
@property int sort;
@property NSString *created_at;
@property NSString *updated_at;
@property NSArray *tags;//Array<TagModel>
-(NSString *)description;
@end
