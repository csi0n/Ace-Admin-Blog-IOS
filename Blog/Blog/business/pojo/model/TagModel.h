//
//  TagModel.h
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "BaseModel.h"

@interface TagModel : BaseModel
@property int id;
@property NSString *name;
@property NSString *created_at;
@property NSString *updated_at;

-(NSString *)description;
@end
