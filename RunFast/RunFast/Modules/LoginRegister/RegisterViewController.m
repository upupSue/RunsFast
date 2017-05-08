//
//  RegisterViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/5/8.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "RegisterViewController.h"
#import "DeformationButton.h"
#import "HomeViewController.h"

#import "MainTabBarViewController.h"
#define loginBtnW 255

@interface RegisterViewController (){
    DeformationButton *regisBtn;
}
@property (strong, nonatomic) IBOutlet UIView *registerView;

@end
@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    regisBtn = [[DeformationButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-loginBtnW)/2, 425+60, loginBtnW, 55)];
    regisBtn.contentColor = CBLUE;
    regisBtn.progressColor = [UIColor whiteColor];
    [self.view addSubview:regisBtn];
    
    [regisBtn.forDisplayButton setTitle:@"注册" forState:UIControlStateNormal];
    [regisBtn.forDisplayButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [regisBtn.forDisplayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [regisBtn.forDisplayButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];
    regisBtn.layer.cornerRadius=10;
    regisBtn.clipsToBounds=YES;
    [regisBtn.forDisplayButton setBackgroundColor:CBLUE];
    
    [regisBtn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated{
    _registerView.layer.cornerRadius=10;
    _registerView.layer.borderColor=LINE_COLOR.CGColor;
    _registerView.layer.borderWidth=1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnEvent{
    NSLog(@"btnEvent");
    regisBtn.layer.masksToBounds=NO;
    //    [self toHome];
    [self performSelector:@selector(toHome) withObject:nil afterDelay:2];
}

-(void)toHome{
    MainTabBarViewController *tabBarVc = [[MainTabBarViewController alloc] init];
    [self.navigationController pushViewController:tabBarVc animated:YES];
}

@end
