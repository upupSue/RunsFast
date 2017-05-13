//
//  ViewWithCurve.h
//  RunFast
//
//  Created by 方琼蔚 on 17/5/13.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, shape) {
    curve = 1,
    triangle = 2,
    InvertedTriangle=3,
};


@interface ViewWithCurve : UIView

@property(assign,nonatomic)shape shape;
@property(strong,nonatomic)UIColor *color;
-(instancetype)initWithFrame:(CGRect)frame Type:(shape)shape color:(UIColor *)color;
@end
