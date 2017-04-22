//
//  Constant.h
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

//color
#define Rgb2UIColor(r, g, b, a)        [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:((a)/1.0)]

#define THEME_BGCOLOR Rgb2UIColor(21 , 181, 233, 1) //主背景色
#define NAV_BGCOLOR Rgb2UIColor(37 , 65, 67, 1) //辅背景色
#define THIRD_BGCOLOR Rgb2UIColor(241 , 252, 252, 1) //底色
#define FOURTH_BGCOLOR Rgb2UIColor(247 , 85, 85, 1) //红色

#define FIRST_FONTCOLOR Rgb2UIColor(39 , 208, 216, 1) //主要字体色
#define SECOND_FONTCOLOR Rgb2UIColor(8 , 100, 105, 1) //笔记字体色
#define TintColor Rgb2UIColor(41 , 128, 132, 1) //TintColor
#define FOURTH_FONTCOLOR Rgb2UIColor(137 , 207, 209, 1) //白绿

#define LINE_COLOR Rgb2UIColor(225 , 225, 225, 1) //线条色
#define GRAY_COLOR Rgb2UIColor(149 , 149, 149, 1) //灰色
#define BGGRAY_COLOR Rgb2UIColor(248 , 248, 248, 1) //背景灰
#define Btn_COLOR Rgb2UIColor(24 , 133, 254, 1) //按钮蓝

//size
#define SCREEN_HEIGHT ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.height : [[UIScreen mainScreen] bounds].size.width)

#define SCREEN_WIDTH  ((([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortrait) || ([UIApplication sharedApplication].statusBarOrientation == UIInterfaceOrientationPortraitUpsideDown)) ? [[UIScreen mainScreen] bounds].size.width : [[UIScreen mainScreen] bounds].size.height)

#ifdef DEBUG
#define DBG(format, ...) NSLog(format, ## __VA_ARGS__)
#else
#define DBG(format, ...)
#endif

#define IS_NULL_STRING(__POINTER) \
(__POINTER == nil || \
__POINTER == (NSString *)[NSNull null] || \
![__POINTER isKindOfClass:[NSString class]] || \
![__POINTER length])

#endif /* Constant_h */
