//
//  UITableView+EmptyData.h
//  Blog
//
//  Created by huaqing chen on 10/21/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UITableView (EmptyData)
- (void) tableViewDisplayWitMsg:(NSString *) message ifNecessaryForRowCount:(NSUInteger) rowCount;
@end
