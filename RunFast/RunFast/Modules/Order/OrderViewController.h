//
//  OrderViewController.h
//  RunFast
//
//  Created by 方琼蔚 on 17/4/27.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, orderState) {
    notHandOver = 1,
    notServed = 2,
    hasBeenServed=3,
    confirmedServed=4,
};

@interface OrderViewController : UIViewController

@property (nonatomic,assign)orderState orderState;

@end
