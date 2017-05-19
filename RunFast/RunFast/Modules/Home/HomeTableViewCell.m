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
         
         
         UILabel *num=[[UILabel alloc]init];
         num.font=[UIFont systemFontOfSize:14];
         num.textColor=SECOND_FONTCOLOR;
         num.text=@"数量：";
         [self addSubview:num];
         [num mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(_spName.mas_bottom).offset(12);
             make.left.mas_equalTo(_view.mas_left).offset(15);
         }];

         _ordnum=[[UILabel alloc]init];
         _ordnum.font=[UIFont systemFontOfSize:14];
         _ordnum.textColor=SECOND_FONTCOLOR;
         [self addSubview:_ordnum];
         [_ordnum mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(_spName.mas_bottom).offset(12);
             make.left.mas_equalTo(_view.mas_left).offset(100);
         }];
         
         UILabel *addr=[[UILabel alloc]init];
         addr.font=[UIFont systemFontOfSize:14];
         addr.textColor=SECOND_FONTCOLOR;
         addr.text=@"地址：";
         [self addSubview:addr];
         [addr mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(num.mas_bottom).offset(9);
             make.left.mas_equalTo(_view.mas_left).offset(15);
         }];
         
         _addr=[[UILabel alloc]init];
         _addr.font=[UIFont systemFontOfSize:14];
         _addr.textColor=SECOND_FONTCOLOR;
         [self addSubview:_addr];
         [_addr mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(num.mas_bottom).offset(9);
             make.left.mas_equalTo(_view.mas_left).offset(100);
         }];
         
         _time=[[UILabel alloc]init];
         _time.font=[UIFont systemFontOfSize:10];
         _time.textColor=TintColor;
         [self addSubview:_time];
         [_time mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(_spName.mas_top);
             make.right.mas_equalTo(self.mas_right).offset(-15);
         }];
         
         _getbtn=[[DGThumbUpButton alloc]init];
         [self addSubview:_getbtn];
         [_getbtn mas_makeConstraints:^(MASConstraintMaker *make) {
             make.centerY.equalTo(self.mas_centerY).offset(8);
             make.centerX.equalTo(_time.mas_centerX).offset(6);
         }];
         
         UILabel *grab=[[UILabel alloc]init];
         grab.font=[UIFont systemFontOfSize:16];
         grab.textColor=FONTCOLOR;
         grab.text=@"抢";
         [self addSubview:grab];
         [grab mas_makeConstraints:^(MASConstraintMaker *make) {
             make.top.mas_equalTo(_getbtn.mas_bottom).offset(6);
             make.centerX.equalTo(_time.mas_centerX).offset(6);
         }];
         
//         _addr.text=@"山南一幢";
//         _ordnum.text=@"10";
//         _spName.text=@"厨禾";
//         _time.text=@"2017/04/12 13:12";

     }
     return self;
}

-(void)config:(orderInfo *)model{
    self.spName.text=model.sellername;
    self.ordnum.text=model.listnum;
    self.addr.text=model.placename;
    self.time.text=model.listtime;
    [self layoutIfNeeded];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}



@end
