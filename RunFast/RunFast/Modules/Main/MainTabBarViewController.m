//
//  MainTabBarViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HomeViewController.h"
@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    HomeViewController *HomeVC = [[HomeViewController alloc]init];
    UINavigationController *HomeNVC = [[UINavigationController alloc] initWithRootViewController:HomeVC];
    HomeNVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"跑得快" image:[[UIImage imageNamed:@"Home"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"use_homepage"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];;
    
//    DistributionViewController *dVC = [[DistributionViewController alloc] init];
//    UINavigationController *dNVC = [[UINavigationController alloc] initWithRootViewController:dVC];
//    dNVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"配送状态" image:[[UIImage imageNamed:@"Distribution"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Use_Distribution"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];;
//    
//    AirPlainViewController *apVC = [[AirPlainViewController alloc] init];
//    self.apNVC = [[UINavigationController alloc] initWithRootViewController:apVC];
//    self.apNVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"上单" image:[[UIImage imageNamed:@"Airplane"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Use_airplain"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
//    
//    MyViewController *mVC = [[MyViewController alloc]init];
//    UINavigationController *mNVC = [[UINavigationController alloc] initWithRootViewController:mVC];
//    mNVC.tabBarItem = [[UITabBarItem alloc]initWithTitle:@"主页" image:[[UIImage imageNamed:@"person-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"Person_use-1"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    
    self.tabBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    [self setViewControllers:@[HomeNVC]];
    [self setSelectedIndex:0];
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

@end
