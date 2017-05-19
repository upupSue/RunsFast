//
//  OrderModel.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/28.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "OrderModel.h"

@implementation OrderModel

+ (NSDictionary *)modelContainerPropertyGenericClass{
    return @{@"addressList" : [orderInfo class]};
}
@end

@implementation orderInfo

- (id)copyWithZone:(NSZone *)zone { return [self yy_modelCopy]; }

@end
