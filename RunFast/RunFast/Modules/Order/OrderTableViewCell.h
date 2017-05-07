//
//  OrderTableViewCell.h
//  RunFast
//
//  Created by 方琼蔚 on 17/5/5.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderTableViewCell : UITableViewCell

@property(nonatomic,strong)UILabel *shopName;
@property(nonatomic,strong)UILabel *odrNum;
@property(nonatomic,strong)UILabel *odrAddr;
@property(nonatomic,strong)UILabel *time;
@property(nonatomic,strong)UILabel *deliveryNum;
@property(nonatomic,strong)UIImageView *shopImg;

@end
