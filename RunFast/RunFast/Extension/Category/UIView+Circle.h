//
//  UIView+Circle.h
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (Circle)

-(UIView *)setLayerAndBezierPathCutCircularByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii;

@end
