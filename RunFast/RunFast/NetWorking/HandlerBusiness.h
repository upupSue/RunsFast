//
//  HandlerBusiness.h
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import  "AFNetworking.h"

extern NSString *const ApiLogin;
extern NSString *const ApiRegister;
extern NSString *const ApiGetNotPickUpOrder;
extern NSString *const ApiGetPickedUpOrder;
extern NSString *const ApiUpdatePassword;

@interface HandlerBusiness : AFHTTPSessionManager

typedef void (^CompleteBlock)();
typedef void (^SuccessBlock)(id data , id msg);
typedef void (^FailedBlock)(NSInteger code ,id errorMsg);

+(void)ServiceWithApicode:(NSString*)apicode Parameters:(NSDictionary*)parameters Success:(SuccessBlock)success Failed:(FailedBlock)failed Complete:(CompleteBlock)complete;

@end
