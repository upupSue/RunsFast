//
//  OrderTableViewCell.m
//  RunFast
//
//  Created by 方琼蔚 on 17/5/5.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "OrderTableViewCell.h"

@implementation OrderTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if(self){
        self.backgroundColor=[UIColor clearColor];
        
        UIView *bgView=[[UIView alloc]init];
        bgView.backgroundColor=[UIColor whiteColor];
        [self addSubview:bgView];
        [bgView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.mas_top).offset(0);
            make.left.mas_equalTo(self.mas_left).offset(0);
            make.right.mas_equalTo(self.mas_right).offset(0);
            make.bottom.mas_equalTo(self.mas_bottom).offset(-10);
        }];
        
        self.shopName=[[UILabel alloc]init];
        self.shopName.font=[UIFont systemFontOfSize:16];
        self.shopName.textColor=FONTCOLOR;
        [bgView addSubview:self.shopName];
        [self.shopName mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(bgView.mas_top).offset(12);
            make.left.mas_equalTo(bgView.mas_left).offset(10);
        }];
        
        self.time=[[UILabel alloc]init];
        self.time.font=[UIFont systemFontOfSize:12];
        self.time.textColor=TintColor;
        [bgView addSubview:self.time];
        [self.time mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(self.shopName.mas_centerY);
            make.right.mas_equalTo(bgView.mas_right).offset(-10);
        }];
        
        self.shopImg=[[UIImageView alloc]init];
        [bgView addSubview:self.shopImg];
        [self.shopImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.shopName.mas_bottom).offset(14);
            make.left.mas_equalTo(bgView.mas_left).offset(10);
            make.size.mas_equalTo(CGSizeMake(60, 60));
        }];
        
        UILabel *num=[[UILabel alloc]init];
        num.font=[UIFont systemFontOfSize:16];
        num.text=@"数量";
        num.textColor=SECOND_FONTCOLOR;
        [bgView addSubview:num];
        [num mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.shopImg.mas_top).offset(5);
            make.left.mas_equalTo(self.shopImg.mas_right).offset(10);
        }];
        
        UILabel *addr=[[UILabel alloc]init];
        addr.font=[UIFont systemFontOfSize:16];
        addr.text=@"配送地点";
        addr.textColor=SECOND_FONTCOLOR;
        [bgView addSubview:addr];
        [addr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(num.mas_bottom).offset(12);
            make.left.mas_equalTo(self.shopImg.mas_right).offset(10);
        }];
        
        self.odrAddr=[[UILabel alloc]init];
        self.odrAddr.font=[UIFont systemFontOfSize:16];
        self.odrAddr.textColor=SECOND_FONTCOLOR;
        [bgView addSubview:self.odrAddr];
        [self.odrAddr mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(addr.mas_top);
            make.left.mas_equalTo(addr.mas_right).offset(40);
        }];
        
        self.odrNum=[[UILabel alloc]init];
        self.odrNum.font=[UIFont systemFontOfSize:16];
        self.odrNum.textColor=SECOND_FONTCOLOR;
        [bgView addSubview:self.odrNum];
        [self.odrNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(num.mas_top);
            make.left.mas_equalTo(self.odrAddr.mas_left);
        }];
        
        UIView *line=[[UIView alloc]init];
        line.backgroundColor=LINE_COLOR;
        [bgView addSubview:line];
        [line mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(self.shopImg.mas_bottom).offset(6);
            make.left.mas_equalTo(bgView.mas_left);
            make.size.mas_equalTo(CGSizeMake(SCREEN_WIDTH, 1));
        }];
        
        
        UIImageView *delImg=[[UIImageView alloc]init];
        delImg.image=[UIImage imageNamed:@"icon_num"];
        [bgView addSubview:delImg];
        [delImg mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(line.mas_bottom).offset(14);
            make.left.mas_equalTo(bgView.mas_centerX).offset(-54);
        }];
        
        UILabel *delNum=[[UILabel alloc]init];
        delNum.font=[UIFont systemFontOfSize:10];
        delNum.textColor=TintColor;
        delNum.text=@"配送编号";
        [bgView addSubview:delNum];
        [delNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(delImg.mas_centerY);
            make.left.mas_equalTo(bgView.mas_centerX).offset(-37);
        }];
        
        self.deliveryNum=[[UILabel alloc]init];
        self.deliveryNum.font=[UIFont systemFontOfSize:20];
        self.deliveryNum.textColor=SBLUE;
        [bgView addSubview:self.deliveryNum];
        [self.deliveryNum mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(delImg.mas_centerY);
            make.left.mas_equalTo(bgView.mas_centerX).offset(16);
        }];
        
        
        UIButton *mybtn=[[UIButton alloc]init];
        [mybtn setTitle:@"确认交接" forState:UIControlStateNormal];
        [mybtn setTitleColor:SBLUE forState:UIControlStateNormal];
        mybtn.titleLabel.font=[UIFont systemFontOfSize:10];
        [mybtn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
        [bgView addSubview:mybtn];
        [mybtn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(delImg.mas_centerY);
            make.right.mas_equalTo(bgView.mas_right).offset(-14);
            make.size.mas_equalTo(CGSizeMake(60, 22));
        }];
        mybtn.layer.cornerRadius=3;
        mybtn.layer.borderWidth=1;
        mybtn.layer.borderColor=SBLUE.CGColor;
        
        self.shopName.text=@"阿达的美食店";
        self.odrNum.text=@"10";
        self.odrAddr.text=@"山南一幢";
        self.time.text=@"2017/04/12 13:12";
        self.deliveryNum.text=@"123";
        self.shopImg.image=[UIImage imageNamed:@"img_storeicon"];
        
        
    }
    return self;
}

-(void)config:(orderInfo *)model{
    self.shopName.text=model.sellername;
    self.odrNum.text=model.listnum;
    self.odrAddr.text=model.placename;
    self.time.text=model.placename;
    self.deliveryNum.text=model.listtime;
    self.shopImg.image=[UIImage imageNamed:model.userimgurl];
}

-(void)btnClick{
    self.block();
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

@end
