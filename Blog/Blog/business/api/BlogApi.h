//
//  Header.h
//  Blog
//
//  Created by huaqing chen on 10/16/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GetHomeIndexRequest;
@protocol BlogApi <NSObject>

-(void)GetHomeIndexRequest:(GetHomeIndexRequest *)request;

@end
