//
//  UIView+Circle.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "UIView+Circle.h"

@implementation UIView (Circle)

-(UIView *)setLayerAndBezierPathCutCircularByRoundingCorners:(UIRectCorner)corners cornerRadii:(CGSize)cornerRadii
{
    // 创建BezierPath 并设置角 和 半径 这里只设置了 左上 和 右上
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:self.bounds byRoundingCorners:corners cornerRadii:cornerRadii];
    
    CAShapeLayer *layer = [[CAShapeLayer alloc] init];
    layer.frame = self.bounds;
    layer.path = path.CGPath;
    self.layer.mask = layer;
    
    return self;
}

@end
