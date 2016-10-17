//
//  ImageLoadHelper.h
//  Blog
//
//  Created by huaqing chen on 10/17/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImageLoadHelper : NSObject
+ (void)loadWithImageUrl:(NSString *)imageUrl imageView:(UIImageView *)imageView;

+ (void)loadWithImageUrl:(NSString *)imageUrl tableViewCell:(UITableViewCell *)cell;
@end
