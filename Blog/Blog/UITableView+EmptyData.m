//
//  UITableView+EmptyData.m
//  Blog
//
//  Created by huaqing chen on 10/21/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import "UITableView+EmptyData.h"

@implementation UITableView (EmptyData)
- (void) tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount
{
    if (rowCount == 0) {
        UILabel *messageLabel = [UILabel new];
        messageLabel.text = message;
        messageLabel.font = [UIFont preferredFontForTextStyle:UIFontTextStyleBody];
        messageLabel.textColor = [UIColor lightGrayColor];
        messageLabel.textAlignment = NSTextAlignmentCenter;
        [messageLabel sizeToFit];
        self.backgroundView = messageLabel;
    } else {
        self.backgroundView = nil;
    }
}
@end
