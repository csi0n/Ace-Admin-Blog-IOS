//
//  MainTabContentCellTableViewCell.h
//  Blog
//
//  Created by huaqing chen on 10/17/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MDTableViewCell.h"
@interface MainTabContentCellTableViewCell : MDTableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *head;
@property (weak, nonatomic) IBOutlet UILabel *title;
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UIStackView *tags;

@end
