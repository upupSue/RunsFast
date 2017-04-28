//
//  OrderViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/27.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "OrderViewController.h"
#import "GPSNaviViewController.h"
//#import "MapViewController.h"
#import "RunFast-swift.h"

@interface OrderViewController () <JTSegmentControlDelegate>

@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title= @"单子";
    UIBarButtonItem *gpsBtn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_daohang"]
                                                            style:UIBarButtonItemStylePlain target:self action:@selector(toMapView)];
    
    self.navigationItem.rightBarButtonItem = gpsBtn;
    
    JTSegmentControl *segmentedControl = [[JTSegmentControl alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    segmentedControl.delegate = self;
    segmentedControl.items = @[@"待交接 ", @"待送达", @"已完成"];
    [segmentedControl showBridgeWithShow:true index:1];
    segmentedControl.autoScrollWhenIndexChange = false;
    [self.view addSubview:segmentedControl];
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
