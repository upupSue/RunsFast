//
//  UserDefaultsUtils.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "UserDefaultsUtils.h"

@implementation UserDefaultsUtils
+(void)saveWithDic:(NSDictionary *)dic
{
    NSArray * arrKeys=[dic allKeys];
    if (arrKeys.count>0) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        for (int i=0; i<arrKeys.count; i++) {
            [userDefaults setValue:dic[arrKeys[i]] forKey:arrKeys[i]];
        }
        [userDefaults synchronize];
    }
}

+(void)saveValue:(id) value forKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:value forKey:key];
    [userDefaults synchronize];
}

+(id)valueWithKey:(NSString *)key{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults objectForKey:key];
}

+(BOOL)boolValueWithKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults boolForKey:key];
}

+(void)saveBoolValue:(BOOL)value withKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setBool:value forKey:key];
    [userDefaults synchronize];
}
+(void)removeValueWithKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

+(void)removeValueWithArray:(NSArray *)arr
{
    if (arr&&arr.count>0) {
        NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
        for (int i=0; i<arr.count; i++) {
            [userDefaults removeObjectForKey:arr[i]];
        }
        [userDefaults synchronize];
    }
    
}
+(void)print{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSDictionary *dic = [userDefaults dictionaryRepresentation];
    DBG(@"%@",dic);
}

//可变参数
-(BOOL)isAtLeastOneNullOrEmpty:(NSString *)str,...
{
    NSString * eachStr;
    va_list strList;
    if (IS_NULL_STRING(str)) {
        return YES;
    }
    else
    {
        va_start(strList, str);
        while ((eachStr=va_arg(strList, id))) {
            if(IS_NULL_STRING(eachStr))
                return YES;
        }
        va_end(strList);
        return NO;
    }
    return YES;
}
@end
