//
//  OrderModel.h
//  RunFast
//
//  Created by 方琼蔚 on 17/4/28.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface OrderModel : NSObject

/**
 *  收款账户 ID
 */
@property (nonatomic, copy) NSString *name;
/**
 *  类型 1:支付宝  2：微信支付  3：银行卡
 */
@property (nonatomic, copy) NSString *odrnum;
/**
 *  (姓名/微信账号/银行开户名)
 */
@property (nonatomic, copy) NSString *addr;

@end
