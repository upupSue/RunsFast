//
//  ViewWithCurve.m
//  RunFast
//
//  Created by 方琼蔚 on 17/5/13.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "ViewWithCurve.h"

@implementation ViewWithCurve
-(instancetype)initWithFrame:(CGRect)frame Type:(shape)shape color:(UIColor *)color{
    self=[super initWithFrame:frame];
    self.shape=shape;
    self.color=color;
    return self;
}

- (void)drawRect:(CGRect)rect {
    self.backgroundColor=[UIColor clearColor];

    switch (_shape) {
        case 1:{
            //// Oval Drawing
            CGRect ovalRect = CGRectMake(174, 18.5, 9, 7);
            UIBezierPath* ovalPath = [UIBezierPath bezierPath];
            [ovalPath addArcWithCenter: CGPointMake(0, 0) radius: ovalRect.size.width / 2 startAngle: 20 * M_PI/180 endAngle: -200 * M_PI/180 clockwise: YES];
            
            CGAffineTransform ovalTransform = CGAffineTransformMakeTranslation(CGRectGetMidX(ovalRect), CGRectGetMidY(ovalRect));
            ovalTransform = CGAffineTransformScale(ovalTransform, 1, ovalRect.size.height / ovalRect.size.width);
            [ovalPath applyTransform: ovalTransform];
            
            [self.color setStroke];
            ovalPath.lineWidth = 1;
            ovalPath.lineCapStyle = kCGLineCapSquare;
            ovalPath.lineJoinStyle = kCGLineJoinBevel;
            [ovalPath stroke];
            
            
            //// Oval 3 Drawing
            CGRect oval3Rect = CGRectMake(183, 20, 8, 7);
            UIBezierPath* oval3Path = [UIBezierPath bezierPath];
            [oval3Path addArcWithCenter: CGPointMake(0, 0) radius: oval3Rect.size.width / 2 startAngle: -160 * M_PI/180 endAngle: -20 * M_PI/180 clockwise: YES];
            
            CGAffineTransform oval3Transform = CGAffineTransformMakeTranslation(CGRectGetMidX(oval3Rect), CGRectGetMidY(oval3Rect));
            oval3Transform = CGAffineTransformScale(oval3Transform, 1, oval3Rect.size.height / oval3Rect.size.width);
            [oval3Path applyTransform: oval3Transform];
            
            [self.color setStroke];
            oval3Path.lineWidth = 1;
            oval3Path.lineCapStyle = kCGLineCapSquare;
            oval3Path.lineJoinStyle = kCGLineJoinBevel;
            [oval3Path stroke];
            
            
            //// Oval 2 Drawing
            UIBezierPath* oval2Path = [UIBezierPath bezierPath];
            [oval2Path moveToPoint: CGPointMake(199.66, 23.2)];
            [oval2Path addCurveToPoint: CGPointMake(193.89, 25.29) controlPoint1: CGPointMake(198.81, 25.01) controlPoint2: CGPointMake(196.22, 25.95)];
            [oval2Path addCurveToPoint: CGPointMake(191.2, 23.2) controlPoint1: CGPointMake(192.64, 24.94) controlPoint2: CGPointMake(191.65, 24.17)];
            [self.color setStroke];
            oval2Path.lineWidth = 1;
            oval2Path.lineCapStyle = kCGLineCapSquare;
            oval2Path.lineJoinStyle = kCGLineJoinBevel;
            [oval2Path stroke];
        }
            break;
        case 2:
        {
            
            //// Polygon Drawing
            UIBezierPath* polygonPath = [UIBezierPath bezierPath];
            [polygonPath moveToPoint: CGPointMake(187, 14)];
            [polygonPath addLineToPoint: CGPointMake(193.93, 26.75)];
            [polygonPath addLineToPoint: CGPointMake(180.07, 26.75)];
            [polygonPath closePath];
            [self.color setFill];
            [polygonPath fill];
        }
            break;
        case 3:
        {
            //// Polygon Drawing
            UIBezierPath* polygonPath = [UIBezierPath bezierPath];
            [polygonPath moveToPoint: CGPointMake(187, 30.5)];
            [polygonPath addLineToPoint: CGPointMake(180.07, 17.75)];
            [polygonPath addLineToPoint: CGPointMake(193.93, 17.75)];
            [polygonPath addLineToPoint: CGPointMake(187, 30.5)];
            [polygonPath closePath];
            [self.color setFill];
            [polygonPath fill];
        }
            break;
        default:
            break;
    }
    

}

@end
