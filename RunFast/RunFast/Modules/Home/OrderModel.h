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
 * 商家名
 */
@property (nonatomic, copy) NSString *name;
/**
 * 订单数量
 */
@property (nonatomic, copy) NSString *odrnum;
/**
 * 订单地点
 */
@property (nonatomic, copy) NSString *addr;
/**
 * 订单时间
 */
@property (nonatomic, copy) NSString *time;
/**
 * 配送编号
 */
@property (nonatomic, copy) NSString *delNum;
/**
 * 商家图片
 */
@property (nonatomic, copy) NSString *shopImg;

@end
