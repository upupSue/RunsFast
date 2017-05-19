//
//  RegisterViewController.h
//  RunFast
//
//  Created by 方琼蔚 on 17/5/8.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef NS_ENUM(NSInteger, account) {
    signup= 1,
    resetPsd = 2,
};

@interface RegisterViewController : UIViewController

@property (nonatomic,assign)account accountType;

@end
