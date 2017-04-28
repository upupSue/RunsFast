//
//  HomeTableViewCell.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/27.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "HomeTableViewCell.h"

@implementation HomeTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
     self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
     if (self) {
         self.backgroundColor=[UIColor clearColor];
         
         _view=[[UIView alloc]init];
         _view.backgroundColor=[UIColor whiteColor];
         [self addSubview:_view];
         [_view mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(self.mas_top).offset(20);
             make.left.mas_equalTo(self.mas_left).offset(0);
             make.right.mas_equalTo(self.mas_right).offset(0);
             make.bottom.mas_equalTo(self.mas_bottom).offset(0);
         }];
         _view.layer.cornerRadius=8;
         //    [cell.view setLayerAndBezierPathCutCircularByRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];

         _spName=[[UILabel alloc]init];
         _spName.font=[UIFont systemFontOfSize:18];
         _spName.textColor=FONTCOLOR;
         [self addSubview:_spName];
         [_spName mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(_view.mas_top).offset(15);
             make.left.mas_equalTo(_view.mas_left).offset(15);
         }];
         
         _ordnum=[[UILabel alloc]init];
         _ordnum.font=[UIFont systemFontOfSize:14];
         _ordnum.textColor=TintColor;
         [self addSubview:_ordnum];
         [_ordnum mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(_spName.mas_bottom).offset(12);
             make.left.mas_equalTo(_view.mas_left).offset(15);
         }];
         
         _addr=[[UILabel alloc]init];
         _addr.font=[UIFont systemFontOfSize:14];
         _addr.textColor=TintColor;
         [self addSubview:_addr];
         [_addr mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(_ordnum.mas_bottom).offset(9);
             make.left.mas_equalTo(_view.mas_left).offset(15);
         }];
         
         UIButton *btn=[[UIButton alloc]init];
         [btn setBackgroundImage:[UIImage imageNamed:@"icon_qiang"] forState:UIControlStateNormal];
         [self addSubview:btn];
         [btn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerY.equalTo(self.mas_centerY).offset(10);
             make.right.mas_equalTo(self.mas_right).offset(-15);
         }];
         
         _addr.text=@"地址：";
         _ordnum.text=@"数量：";
         _spName.text=@"厨禾";

     }
     return self;
}

-(void)config:(OrderModel *)model{
//    self.spName.text=model.name;
//    self.ordnum.text=model.odrnum;
//    self.addr.text=model.addr;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}



@end
