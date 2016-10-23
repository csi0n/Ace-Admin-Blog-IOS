//
//  Config.h
//  Blog
//
//  Created by huaqing chen on 10/21/16.
//  Copyright © 2016 csi0n. All rights reserved.
//

#ifndef Config_h
#define Config_h

// UIColor Helper Macro
#define UIColorFromRGB(rgbValue) [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16)) / 255.0 green:((float)((rgbValue & 0xFF00) >> 8)) / 255.0 blue:((float)(rgbValue & 0xFF)) / 255.0 alpha:1.0]
// App Colors
#define THEME_COLOR UIColorFromRGB(0x303F9F)
#define ALL_BACK_COLOR UIColorFromRGB(0xf0eff5)
// 4.屏幕大小尺寸
#define screen_width [UIScreen mainScreen].bounds.size.width
#define screen_height [UIScreen mainScreen].bounds.size.height
#endif /* Config_h */
