//
//  CommentsViewCellTableViewCell.h
//  Blog
//
//  Created by huaqing chen on 10/29/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CommentsViewCellTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLb;
@property (weak, nonatomic) IBOutlet UILabel *contentLb;

@end
