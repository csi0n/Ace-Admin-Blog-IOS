//
//  CommentsViewCellTableViewCell.m
//  Blog
//
//  Created by huaqing chen on 10/29/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "CommentsViewCellTableViewCell.h"

@implementation CommentsViewCellTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}
-(void)setComment:(CommentModel *)comment{
    [self.titleLb setText:comment.author_name];
    [self.contentLb setText:comment.message];
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
