//
//  HandlerBusiness.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "HandlerBusiness.h"
#import "YYModel.h"
#define BaseURLString  @"http://runfast.ngrok.cc/"

static HandlerBusiness *_sharedManager = nil;
static dispatch_once_t onceToken;
NSString *const ApiLogin = @"login";
NSString *const ApiRegister = @"register";
NSString *const ApiGetNotPickUpOrder = @"userlist";
NSString *const ApiGetPickedUpOrder = @"getUserList";
NSString *const ApiUpdatePassword = @"updatePassword";
@implementation HandlerBusiness

+(void)ServiceWithApicode:(NSString*)apicode Parameters:(NSDictionary*)parameters Success:(SuccessBlock)success Failed:(FailedBlock)failed Complete:(CompleteBlock)complete{
    dispatch_once(&onceToken, ^{
        _sharedManager = [[HandlerBusiness alloc] initWithBaseURL:[NSURL URLWithString:BaseURLString]];
        _sharedManager.requestSerializer = [AFJSONRequestSerializer serializer];
        _sharedManager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/plain",@"text/html",nil];
    });
    if (parameters==nil) {
        parameters = @{};
    }

    [_sharedManager POST:apicode parameters:parameters progress:nil success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        if(complete != nil){
            complete(); 
        }
        if([responseObject[@"status"] integerValue]==100)
        {
            NSString *modelStr = [HandlerBusiness mapModel][apicode];
            if (modelStr!=nil && ![modelStr isEqualToString:@""]) {
                Class cla = NSClassFromString(modelStr);
                if (!cla) {
                    DBG(@"找不到对应模型类，%@", modelStr);
                }
                success([cla yy_modelWithJSON:responseObject[@"data"]],responseObject[@"msg"]);
            }
            else{
                success(responseObject[@"data"],responseObject[@"msg"]);
            }
        }
        else{
            failed([responseObject[@"status"] integerValue] , responseObject[@"msg"]);
        }
        
    }failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error){
        if(complete != nil){
            complete();
        }
        failed([@-9999 integerValue] , @"网络错误");
    }];
}

+(NSDictionary *)mapModel
{
    return @{
                          ApiGetNotPickUpOrder:@"OrderModel",
                          ApiGetPickedUpOrder:@"OrderModel",
             };
}

@end
