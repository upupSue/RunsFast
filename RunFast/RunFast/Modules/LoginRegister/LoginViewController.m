//
//  LoginViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/26.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "LoginViewController.h"
#import "DeformationButton.h"
#import "HomeViewController.h"

#import "MainTabBarViewController.h"
#define loginBtnW 255

@interface LoginViewController (){
    DeformationButton *loginBtn;
}

@property (weak, nonatomic) IBOutlet UIView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;

    loginBtn = [[DeformationButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-loginBtnW)/2, 500, loginBtnW, 55)];
    loginBtn.contentColor = CBLUE;
    loginBtn.progressColor = [UIColor whiteColor];
    [self.view addSubview:loginBtn];
    
    [loginBtn.forDisplayButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn.forDisplayButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [loginBtn.forDisplayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn.forDisplayButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];
//    [loginBtn setLayerAndBezierPathCutCircularByRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
    
    [loginBtn.forDisplayButton setBackgroundColor:CBLUE];
    
    [loginBtn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
}

-(void)viewWillAppear:(BOOL)animated{
//    [_loginView setLayerAndBezierPathCutCircularByRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(10, 10)];
    _loginView.layer.cornerRadius=10;
    _loginView.layer.borderColor=LINE_COLOR.CGColor;
    _loginView.layer.borderWidth=1;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)btnEvent{
    NSLog(@"btnEvent");
    loginBtn.layer.masksToBounds=NO;
//    [self toHome];
    [self performSelector:@selector(toHome) withObject:nil afterDelay:2];

}

-(void)toHome{
    MainTabBarViewController *tabBarVc = [[MainTabBarViewController alloc] init];
    [self.navigationController pushViewController:tabBarVc animated:YES];
}

@end
