//
//  HomeTableViewCell.h
//  RunFast
//
//  Created by 方琼蔚 on 17/4/27.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "OrderModel.h"

@interface HomeTableViewCell : UITableViewCell

@property(nonatomic,strong)UIView *view;
@property(nonatomic,strong)UILabel *spName;
@property(nonatomic,strong)UILabel *ordnum;
@property(nonatomic,strong)UILabel *addr;

-(void)config:(OrderModel *)model;

@end