//
//  OrderModel.h
//  RunFast
//
//  Created by 方琼蔚 on 17/4/28.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import <Foundation/Foundation.h>


@class orderInfo;

@interface OrderModel : NSObject

@property (nonatomic, strong) NSArray<orderInfo * > *orderList;

@end


@interface orderInfo : NSObject
/**
 * 商家名
 */
@property (nonatomic, copy) NSString *sellername;
/**
 * 订单数量
 */
@property (nonatomic, copy) NSString *listnum;
/**
 * 订单地点
 */
@property (nonatomic, copy) NSString *placename;
/**
 * 订单时间
 */
@property (nonatomic, copy) NSString *listtime;
/**
 * 配送编号
 */
@property (nonatomic, copy) NSString *listid;
/**
 * 商家图片
 */
@property (nonatomic, copy) NSString *userimgurl;

@end
