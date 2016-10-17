//
//  CateModel.h
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseModel.h"
#import "ArticleModel.h"
#import <Foundation/Foundation.h>
@interface CateModel : BaseModel
@property int id;
@property NSString *name;
@property int pid;
@property int sort;
@property NSString *created_at;
@property NSString *updated_at;
@property NSArray *articles;//Array<ArticleModel>

-(NSString *)description;
@end
