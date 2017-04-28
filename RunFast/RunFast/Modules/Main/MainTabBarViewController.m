//
//  MainTabBarViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "MainTabBarViewController.h"
#import "HomeViewController.h"
#import "OrderViewController.h"
#import "MessageViewController.h"
#import "PesonalViewController.h"
@interface MainTabBarViewController ()

@end

@implementation MainTabBarViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    

    UITabBarItem *item1 = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"icon_index_blue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_index_blue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    item1.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);
    
    UITabBarItem *item2 = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"icon_danzi_dark"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_danzi_blue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    item2.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

    UITabBarItem *item3 = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"icon_message_dark"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_message_blue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    item3.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

    UITabBarItem *item4 = [[UITabBarItem alloc]initWithTitle:nil image:[[UIImage imageNamed:@"icon_my_dark"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] selectedImage:[[UIImage imageNamed:@"icon_my_blue"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
    item4.imageInsets = UIEdgeInsetsMake(6, 0, -6, 0);

 
    UINavigationController *homeNVC = [[UINavigationController alloc] initWithRootViewController:[HomeViewController new]];
    homeNVC.tabBarItem=item1;
    
    UINavigationController *orderNVC = [[UINavigationController alloc] initWithRootViewController:[OrderViewController new]];
    orderNVC.tabBarItem=item2;
    
    UINavigationController *msNVC = [[UINavigationController alloc] initWithRootViewController:[MessageViewController new]];
    msNVC.tabBarItem=item3;
    
    UINavigationController *pNVC = [[UINavigationController alloc] initWithRootViewController:[PesonalViewController new]];
    pNVC.tabBarItem=item4;
    
    
    self.tabBar.translucent = NO;
    self.edgesForExtendedLayout = UIRectEdgeNone;
    self.extendedLayoutIncludesOpaqueBars = NO;
    [self setViewControllers:@[homeNVC,orderNVC,msNVC,pNVC]];
    [self setSelectedIndex:0];
}

-(BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController{
    return YES;
}

@end
