//
//  PesonalViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/27.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "PesonalViewController.h"
#import <WebKit/WebKit.h>
#import "RunFast-swift.h"
@interface PesonalViewController ()<WKNavigationDelegate>

@property(nonatomic,strong)LoadingView *loadingView;
@end

@implementation PesonalViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView *blueView=[[UIView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 20)];
    blueView.backgroundColor=CBLUE;
    [self.view addSubview:blueView];
    
    WKWebView *webView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 20, self.view.frame.size.width, self.view.frame.size.height-60)];
    [webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://runfast.ngrok.cc/userpage"]]];
    [self.view addSubview:webView];
    webView.navigationDelegate=self;
}

-(void)viewWillAppear:(BOOL)animated{
    self.navigationController.navigationBar.hidden=YES;
}

-(void)webView:(WKWebView *)webview didStartProvisionalNavigation:(null_unspecified WKNavigation *)navigation{
    LoadingView *loadingView=[LoadingView showLoadingWithViewWithView:self.view];
    self.loadingView = loadingView;

}

-(void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation{
    [self.loadingView hideLoadingView];
}

-(void)webView:(WKWebView *)webView didFailNavigation:(null_unspecified WKNavigation *)navigation withError:(nonnull NSError *)error{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
