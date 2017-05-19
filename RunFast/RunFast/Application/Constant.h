//
//  Constant.h
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#ifndef Constant_h
#define Constant_h

#define kTimeSpan 1.5
//color
#define Rgb2UIColor(r, g, b, a)        [UIColor colorWithRed:((r) / 255.0) green:((g) / 255.0) blue:((b) / 255.0) alpha:((a)/1.0)]

#define NAV_BGCOLOR Rgb2UIColor(35 , 214, 263, 1) //主色
#define CBLUE Rgb2UIColor(96 , 158, 235, 1) //主色
#define SBLUE Rgb2UIColor(72 , 119, 176, 1) //主色

#define BSEA Rgb2UIColor(62 , 62, 62, 1) //主色
#define MGREEN Rgb2UIColor(57 , 155, 202, 1) //主色
#define CEBLUE Rgb2UIColor(100 , 221, 176, 1) //主色

#define BG_COLOR Rgb2UIColor(240 , 242, 243, 1) //背景色
#define FONTCOLOR Rgb2UIColor(60 , 60, 60, 1) //主要字体色
#define SECOND_FONTCOLOR Rgb2UIColor(100 , 100, 100, 1) //主要字体色
#define TintColor Rgb2UIColor(154 , 169, 177, 1) //TintColor

#define LINE_COLOR Rgb2UIColor(225 , 225, 225, 1) //线条色

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

const static NSString *APIKey = @"12030938e5af9ed1e65c9da96728c6d7";

#endif /* Constant_h */
