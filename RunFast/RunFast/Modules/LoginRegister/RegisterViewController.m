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


@interface RegisterViewController ()<UITextFieldDelegate>{
    DeformationButton *regisBtn;
    int _second;
    NSTimer *_timer;
    NSDate *beginDate;
    
}
@property (weak, nonatomic) IBOutlet UIImageView *iconImg;
@property (weak, nonatomic) IBOutlet UITextField *telField;
@property (strong, nonatomic) IBOutlet UIView *registerView;
@property (weak, nonatomic) IBOutlet UITextField *codeField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;
@property (weak, nonatomic) IBOutlet UILabel *getCodeLabel;
@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    _telField.delegate=self;
    _codeField.delegate=self;
    _passwordField.delegate=self;
    regisBtn = [[DeformationButton alloc]initWithFrame:CGRectMake((SCREEN_WIDTH-loginBtnW)/2, 425+60, loginBtnW, 55)];
    regisBtn.contentColor = CBLUE;
    regisBtn.progressColor = [UIColor whiteColor];
    [self.view addSubview:regisBtn];
    
    if(_accountType==1){
        [regisBtn.forDisplayButton setTitle:@"注册" forState:UIControlStateNormal];
    }
    else if(_accountType==2){
        [regisBtn.forDisplayButton setTitle:@"完成" forState:UIControlStateNormal];
    }
    [regisBtn.forDisplayButton.titleLabel setFont:[UIFont systemFontOfSize:18]];
    [regisBtn.forDisplayButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [regisBtn.forDisplayButton setTitleEdgeInsets:UIEdgeInsetsMake(0, 6, 0, 0)];
    regisBtn.layer.cornerRadius=10;
    regisBtn.clipsToBounds=YES;
    [regisBtn.forDisplayButton setBackgroundColor:CBLUE];
    
    [regisBtn addTarget:self action:@selector(btnEvent) forControlEvents:UIControlEventTouchUpInside];
    
    [_iconImg setLayerAndBezierPathCutCircularByRoundingCorners:UIRectCornerAllCorners cornerRadii:CGSizeMake(50, 50)];
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

- (IBAction)goBack:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)btnEvent{
    NSLog(@"btnEvent");
    regisBtn.layer.masksToBounds=NO;
    if(_accountType==1){
        [self toHome];
    }
    else{
        [self toLogin];
    }
//    [self performSelector:@selector(toHome) withObject:nil afterDelay:2];
}

//键盘退出
-(void) touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    [self.telField resignFirstResponder];
    [self.codeField resignFirstResponder];
    [self.passwordField resignFirstResponder];
}

//点击RETURN
-(BOOL)textFieldShouldReturn:(UITextField *)textField
{
    if(textField.tag==8){//用户名输入框
        [self.codeField becomeFirstResponder];
        [self.telField resignFirstResponder];
    }
    if(textField.tag==9){//验证码输入框
        [self.passwordField becomeFirstResponder];
        [self.codeField resignFirstResponder];
    }
    if(textField.tag==10){//密码输入框
        if(_telField.text.length != 0&&_codeField.text.length!=0&&_passwordField.text.length!=0){
            regisBtn.enabled=YES;
        }
        else{
            regisBtn.enabled=NO;
        }
        [self.passwordField resignFirstResponder];
        [self btnEvent];
    }
    return YES;
}

//判断输入框是否为空
- (void)textFieldValueChange:(UITextField *)sender{
    if(sender==_telField){
        if(_telField.text.length != 0&&_second<=0){
            _getCodeLabel.userInteractionEnabled = YES;
        }
        else{
            _getCodeLabel.userInteractionEnabled = NO;
        }
    }
    if(_telField.text.length != 0&&_codeField.text.length!=0&&_passwordField.text.length!=0){
        regisBtn.enabled=YES;
    }
    else{
        regisBtn.enabled=NO;
        [regisBtn setBackgroundColor:[UIColor colorWithRed:203/255.0 green:203/255.0 blue:203/255.0 alpha:1.0]];
    }
}

//获取验证码，判断是否11位纯数字
- (void)sendCodeTouched:(id)sender {
    //非11位手机号
    if(_telField.text.length!=11||![self isPureNumandCharacters:_telField.text]){
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"请输入11位手机号" preferredStyle:UIAlertControllerStyleAlert];
        [alertVC setDismissInterval:kTimeSpan];
        [self presentViewController:alertVC animated:YES completion:nil];
    }
    else{
        NSMutableDictionary *parameter = [[NSMutableDictionary alloc]init];
        [parameter setObject:_telField.text forKey:@"userphone"];
        [parameter setObject:@1 forKey:@"usertype"];
        
        [HandlerBusiness ServiceWithApicode:ApiRegister Parameters:parameter Success:^(id data, id msg){
            DBG(@"success");
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:msg[@"prompt"] preferredStyle:UIAlertControllerStyleAlert];
            [alertVC setDismissInterval:kTimeSpan];
            [self presentViewController:alertVC animated:YES completion:nil];
            
            _getCodeLabel.userInteractionEnabled = NO;
            _second=60;
            _timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(startTime:) userInfo:nil repeats:YES];
            
        }Failed:^(NSInteger code ,id errorMsg){
            DBG(@"failed");
            
            if(code==2){
                UIAlertController *alertVc = [UIAlertController alertControllerWithTitle:nil message:errorMsg[@"prompt"] preferredStyle:UIAlertControllerStyleAlert];
                [alertVc addAction:[UIAlertAction actionWithTitle:@"否" style:UIAlertActionStyleDefault handler:nil]];
                [alertVc addAction:[UIAlertAction actionWithTitle:@"是" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    //跳转到登录页面
                    [self.navigationController popViewControllerAnimated:YES];
                }]];
                [self presentViewController:alertVc animated:YES completion:nil];
            }
            else{
                UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:errorMsg[@"prompt"] preferredStyle:UIAlertControllerStyleAlert];
                [alertVC setDismissInterval:kTimeSpan];
                [self presentViewController:alertVC animated:YES completion:nil];
            }
            
        }Complete:^{

        }];
    }
}

//是否纯数字
- (BOOL)isPureNumandCharacters:(NSString *)string
{
    string = [string stringByTrimmingCharactersInSet:[NSCharacterSet decimalDigitCharacterSet]];
    if(string.length > 0)
    {
        return NO;
    }
    return YES;
}

//验证码倒计时
-(void)startTime:(id)sender{
    if (!beginDate){
        beginDate=[NSDate date];
    }
    if (_second>0) {
        NSTimeInterval interv =[[NSDate date] timeIntervalSinceDate:beginDate];
        _second=60-(int)interv;
        _getCodeLabel.text=[NSString stringWithFormat:@"%02ds",_second];
        
    }
    if (_second<=0) {
        _getCodeLabel.text =@"获取验证码";
        _getCodeLabel.userInteractionEnabled = YES;
        _second=60;
        beginDate=nil;
        [_timer invalidate];
    }
}

-(void)toHome{
    if(_telField.text.length!=11||![self isPureNumandCharacters:_telField.text])
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"请输入11位手机号" preferredStyle:UIAlertControllerStyleAlert];
        [alertVC setDismissInterval:kTimeSpan];
        [self presentViewController:alertVC animated:YES completion:nil];
        [self performSelector:@selector(stopCircle) withObject:nil afterDelay:2];
    }
    else if(self.codeField.text.length!=6){
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"请输入正确的验证码" preferredStyle:UIAlertControllerStyleAlert];
        [alertVC setDismissInterval:kTimeSpan];
        [self presentViewController:alertVC animated:YES completion:nil];
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
        [parameter setObject:@1 forKey:@"usertype"];
        
        [HandlerBusiness ServiceWithApicode:ApiRegister Parameters:parameter Success:^(id data, id msg){
            DBG(@"success");
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message: @"注册成功" preferredStyle:UIAlertControllerStyleAlert];
            [alertVC setDismissInterval:kTimeSpan complete:^{
                [self.navigationController popViewControllerAnimated:YES];
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

-(void)toLogin{
    if(_telField.text.length!=11||![self isPureNumandCharacters:_telField.text])
    {
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"请输入11位手机号" preferredStyle:UIAlertControllerStyleAlert];
        [alertVC setDismissInterval:kTimeSpan];
        [self presentViewController:alertVC animated:YES completion:nil];
        [self performSelector:@selector(stopCircle) withObject:nil afterDelay:2];
    }
    //    else if(self.codeField.text.length!=6){
    //        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:@"请输入正确的验证码" preferredStyle:UIAlertControllerStyleAlert];
    //        [alertVC setDismissInterval:kTimeSpan];
    //        [self presentViewController:alertVC animated:YES completion:nil];
    //    }
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
        [parameter setObject:@1 forKey:@"usertype"];
        
        [HandlerBusiness ServiceWithApicode:ApiUpdatePassword Parameters:parameter Success:^(id data, id msg){
            DBG(@"success");
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message: msg[@"prompt"] preferredStyle:UIAlertControllerStyleAlert];
            [alertVC setDismissInterval:kTimeSpan complete:^{
                [self.navigationController popViewControllerAnimated:YES];
            }];
            [self presentViewController:alertVC animated:YES completion:nil];
            
        }Failed:^(NSInteger code ,id errorMsg){
            DBG(@"failed");
            
            UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:errorMsg[@"prompt"] preferredStyle:UIAlertControllerStyleAlert];
            [alertVC setDismissInterval:kTimeSpan];
            [self presentViewController:alertVC animated:YES completion:nil];
            
        }Complete:^{
            [self performSelector:@selector(stopCircle) withObject:nil afterDelay:2];
        }];
    }
}

-(void)stopCircle{
    regisBtn.isLoading = NO;
    regisBtn.layer.masksToBounds=YES;
}


@end
