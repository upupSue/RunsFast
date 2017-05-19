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
#import "RegisterViewController.h"
#define loginBtnW 255

@interface LoginViewController ()<UITextFieldDelegate>{
    DeformationButton *loginBtn;
}
@property (weak, nonatomic) IBOutlet UITextField *telField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

@property (weak, nonatomic) IBOutlet UIView *loginView;
@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;

    _telField.delegate=self;
    _telField.keyboardType = UIKeyboardTypePhonePad;

    _passwordField.delegate=self;
    _passwordField.secureTextEntry = YES;
    loginBtn = [[DeformationButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-loginBtnW)/2, 425, loginBtnW, 55)];
    loginBtn.contentColor = CBLUE;
    loginBtn.progressColor = [UIColor whiteColor];
    [self.view addSubview:loginBtn];
    
    [loginBtn.forDisplayButton setTitle:@"登录" forState:UIControlStateNormal];
    [loginBtn.forDisplayButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [loginBtn.forDisplayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [loginBtn.forDisplayButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];
    loginBtn.layer.cornerRadius=10;
    loginBtn.clipsToBounds=YES;
    [loginBtn.forDisplayButton setBackgroundColor:CBLUE];
    
    [loginBtn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];

}

-(void)viewWillAppear:(BOOL)animated{
    _loginView.layer.cornerRadius=10;
    _loginView.layer.borderColor=LINE_COLOR.CGColor;
    _loginView.layer.borderWidth=1;
    
    UIButton *forgetBtn=[[UIButton alloc]initWithFrame:CGRectMake(20, 425+55+130, 78, 40)];
    [forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
    [forgetBtn setTitleColor:CEBLUE forState:UIControlStateNormal];
    forgetBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    forgetBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    [forgetBtn addTarget:self action:@selector(forgetPassword) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:forgetBtn];
    
    UIButton *regisBtn=[[UIButton alloc]initWithFrame:CGRectMake(SCREEN_WIDTH-20-80, 425+55+130, 78, 40)];
    [regisBtn setTitle:@"立即注册？" forState:UIControlStateNormal];
    [regisBtn setTitleColor:CEBLUE forState:UIControlStateNormal];
    regisBtn.titleLabel.font=[UIFont systemFontOfSize:14];
    regisBtn.titleLabel.textAlignment=NSTextAlignmentCenter;
    [regisBtn addTarget:self action:@selector(toRegister) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:regisBtn];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)btnEvent{
    NSLog(@"btnEvent");
    loginBtn.layer.masksToBounds=NO;
    loginBtn.isLoading = YES;
    [self enterHome];
//    [self performSelector:@selector(enterHome) withObject:nil afterDelay:2];
}

-(void)forgetPassword{
    RegisterViewController *vc=[[RegisterViewController alloc]init];
    vc.accountType=2;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)toRegister{
    RegisterViewController *vc=[[RegisterViewController alloc]init];
    vc.accountType=1;
    [self.navigationController pushViewController:vc animated:YES];
}

//键盘退出
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.telField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

//点击RETURN
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.tag==8){//用户名输入框
        [self.passwordField becomeFirstResponder];
        [self.telField resignFirstResponder];
    }
    if(textField.tag==10){//密码输入框
        if(_telField.text.length != 0&&_passwordField.text.length!=0){
            loginBtn.enabled=YES;
        }
        else{
            loginBtn.enabled=NO;
        }
        [self.passwordField resignFirstResponder];
        [self btnEvent];
    }
    return YES;
}

//TEXTFIELD判断是否为空
- (void)textFieldValueChange:(UITextField *)sender{
    if(_telField.text.length != 0&&_passwordField.text.length!=0){
        loginBtn.enabled=YES;
    }
    else{
        loginBtn.enabled=NO;
    }
}

-(void)enterHome{
    if(_telField.text.length!=11||![self isPureNumandCharacters:_telField.text])
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"请输入11位手机号" preferredStyle:UIAlertControllerStyleAlert];
        [alertVC setDismissInterval:kTimeSpan];
        [self presentViewController:alertVC animated:YES completion:nil];
        [self performSelector:@selector(stopCircle) withObject:nil afterDelay:2];
    }
    else if(self.passwordField.text.length<6||self.passwordField.text.length>12)
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"请输入6-12位密码" preferredStyle:UIAlertControllerStyleAlert];
        [alertVC setDismissInterval:kTimeSpan];
        [self presentViewController:alertVC animated:YES completion:nil];
        [self performSelector:@selector(stopCircle) withObject:nil afterDelay:2];
    }
    else{
        NSMutableDictionary *parameter = [[NSMutableDictionary alloc]init];
        [parameter setObject:_telField.text forKey:@"userphone"];
        [parameter setObject:[_passwordField.text md5to16Hash] forKey:@"userpassword"];
        [parameter setObject:@0 forKey:@"usertype"];
        
        [HandlerBusiness ServiceWithApicode:ApiLogin Parameters:parameter Success:^(id data, id msg){
            DBG(@"Success");
            //在本地存储userId
            NSLog(@"%@",data[0][@"userid"]);
            [UserDefaultsUtils saveValue:data[0][@"userid"] forKey:@"userId"];
            loginBtn.layer.masksToBounds=NO;

            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"登录成功" preferredStyle:UIAlertControllerStyleAlert];
            [alertVC setDismissInterval:kTimeSpan complete:^{
                MainTabBarViewController *tabBarVc = [[MainTabBarViewController alloc] init];
                [self presentViewController:tabBarVc animated:YES completion:nil];
            }];
            [self presentViewController:alertVC animated:YES completion:nil];
            
        }Failed:^(NSInteger code ,id errorMsg){
            DBG(@"failed");
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:errorMsg preferredStyle:UIAlertControllerStyleAlert];
            [alertVC setDismissInterval:kTimeSpan];
            [self presentViewController:alertVC animated:YES completion:nil];
            

        }Complete:^{
            [self performSelector:@selector(stopCircle) withObject:nil afterDelay:2];
        }];
    }
}

//是否纯数字
- (BOOL)isPureNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0){
        return NO;
    }
    return YES;
}

-(void)stopCircle{
    loginBtn.isLoading = !loginBtn.isLoading;
    loginBtn.layer.masksToBounds=YES;
}

@end
