//
//  OrderViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/27.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "OrderViewController.h"
#import "GPSNaviViewController.h"
#import "MapViewController.h"

@interface OrderViewController ()

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIBarButtonItem *gpsBtn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_daohang"]
                                                            style:UIBarButtonItemStylePlain target:self action:@selector(toMapView)];
    
    self.navigationItem.rightBarButtonItem = gpsBtn;
}

-(void)toMapView{
    //    MapViewController *vc=[[MapViewController alloc]init];
    GPSNaviViewController *vc=[[GPSNaviViewController alloc]init];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
