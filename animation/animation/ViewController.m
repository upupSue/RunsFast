//
//  ViewController.m
//  animation
//
//  Created by 方琼蔚 on 17/5/9.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()<CAAnimationDelegate>{
    CALayer *layer;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    //初始化
    layer = [[CALayer alloc]init];
    layer.backgroundColor = [[UIColor grayColor]CGColor];
    layer.frame = CGRectMake(10, 10, 40, 40);
    
    [self.view.layer addSublayer:layer];

}

- (void)animationDidStart:(CAAnimation *)anim{
    NSLog(@"开始了");
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    NSLog(@"结束了");
}

- (IBAction)beginAnimate:(id)sender {
    CABasicAnimation *positionAnima = [CABasicAnimation animationWithKeyPath:@"position.y"];
//    positionAnima.duration = 2.0f;
//    positionAnima.fillMode=kCAFillModeForwards;
//    positionAnima.removedOnCompletion = NO;
    positionAnima.fromValue = @(0);
    positionAnima.toValue = @(100);
    positionAnima.timingFunction = [CAMediaTimingFunction functionWithName:
                                    kCAMediaTimingFunctionEaseIn];
    
    CABasicAnimation *transformAnima = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    transformAnima.fromValue = @(0);
    transformAnima.toValue = @(M_PI);
    transformAnima.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    
    CAAnimationGroup *animaGroup = [CAAnimationGroup animation];
    animaGroup.duration = 2.0f;
    animaGroup.fillMode = kCAFillModeForwards;
    animaGroup.removedOnCompletion = NO;
    animaGroup.animations = @[positionAnima,transformAnima];
    [layer addAnimation:animaGroup forKey:@"Animation"];
    
//    [layer addAnimation:positionAnima forKey:@"posi"];
    
    animaGroup.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
