//
//  MapViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/27.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "MapViewController.h"
#import <MAMapKit/MAMapKit.h>
#import <AMapFoundationKit/AMapFoundationKit.h>
#import <AMapNaviKit/AMapNaviKit.h>

@interface MapViewController ()<MAMapViewDelegate,AMapNaviDriveManagerDelegate, AMapNaviDriveViewDelegate>{
    NSString *target;
    NSString *origin;
    NSString *city;
}
@property (nonatomic, strong) MAMapView *mapView;

@property (nonatomic, strong) AMapNaviDriveManager *driveManager;
@property (nonatomic, strong) AMapNaviDriveView *driveView;
@property (nonatomic, strong) AMapNaviPoint *startPoint;
@property (nonatomic, strong) AMapNaviPoint *endPoint;
@end

@implementation MapViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setMap];
    [self setlocationDot];
//    [self setGps];

    UIButton *returnBtn=[[UIButton alloc]initWithFrame:CGRectMake(10, 20, 44, 44)];
    [returnBtn setImage:[UIImage imageNamed:@"icon-arrow"] forState:UIControlStateNormal];
    [returnBtn addTarget:self action:@selector(goBack) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:returnBtn];

}

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden=YES;
}

- (void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear:animated];
    //    [self setPointAnnotation];
    //路径规划
//    [self.driveManager calculateDriveRouteWithStartPoints:@[self.startPoint]
//                                                endPoints:@[self.endPoint]
//                                                wayPoints:nil
//                                          drivingStrategy:AMapNaviDrivingStrategySingleDefault];
}

-(void)goBack{
    [self.navigationController popViewControllerAnimated:YES];
}

-(void)setGps{
    //设置导航的起点和终点
    self.startPoint = [AMapNaviPoint locationWithLatitude:39.98 longitude:116.47];
    self.endPoint   = [AMapNaviPoint locationWithLatitude:39.99 longitude:116.45];
    
    
    //初始化AMapNaviDriveManager
    if (self.driveManager == nil){
        self.driveManager = [[AMapNaviDriveManager alloc] init];
        [self.driveManager setDelegate:self];
    }
    
    //初始化AMapNaviDriveView
    if (self.driveView == nil){
        self.driveView = [[AMapNaviDriveView alloc] initWithFrame:self.view.bounds];
        [self.driveView setDelegate:self];
    }
    
    //将AMapNaviManager与AMapNaviDriveView关联起来
    [self.driveManager addDataRepresentative:self.driveView];
    //将AManNaviDriveView显示出来
    [self.view addSubview:self.driveView];
}

-(void)setMap{

    [AMapServices sharedServices].enableHTTPS = YES;//地图需要v4.5.0及以上版本才必须要打开此选项（v4.5.0以下版本，需要手动配置info.plist）
    
    _mapView = [[MAMapView alloc] initWithFrame:self.view.bounds];
    self.mapView.delegate = self;
    
    _mapView.backgroundColor = [UIColor whiteColor];
    _mapView.zoomEnabled = YES;
    _mapView.mapType = MAMapTypeStandard;//普通样式
    _mapView.userTrackingMode=MAUserTrackingModeFollow;//地图跟着位置移动
    _mapView.showsCompass= YES;//设置成NO表示关闭指南针；YES表示显示指南针
    _mapView.compassOrigin= CGPointMake(_mapView.compassOrigin.x, 22);//设置指南针位置
    _mapView.showsScale= NO;//设置成NO表示不显示比例尺；YES表示显示比例尺
    _mapView.scaleOrigin= CGPointMake(_mapView.scaleOrigin.x, 22);//设置比例尺位置
    [_mapView setZoomLevel:17 animated:YES];//缩放等级
    
    [self.view addSubview:_mapView];
    
    //如果您需要进入地图就显示定位小蓝点，则需要下面两行代码
    _mapView.showsUserLocation = YES;
    _mapView.userTrackingMode = MAUserTrackingModeFollow;
}

-(void)setlocationDot{
    MAUserLocationRepresentation *r = [[MAUserLocationRepresentation alloc] init];
    //    r.showsAccuracyRing = NO;///精度圈是否显示，默认YES
    //    r.showsHeadingIndicator = NO;///是否显示方向指示(MAUserTrackingModeFollowWithHeading模式开启)。默认为YES
    //    r.fillColor = [UIColor redColor];///精度圈 填充颜色, 默认 kAccuracyCircleDefaultColor
    //    r.strokeColor = [UIColor blueColor];///精度圈 边线颜色, 默认 kAccuracyCircleDefaultColor
    //    r.lineWidth = 2;///精度圈 边线宽度，默认0
    //    r.enablePulseAnnimation = NO;///内部蓝色圆点是否使用律动效果, 默认YES
    //    r.locationDotBgColor = [UIColor greenColor];///定位点背景色，不设置默认白色
    //    r.locationDotFillColor = [UIColor grayColor];///定位点蓝色圆点颜色，不设置默认蓝色
    //    r.image = [UIImage imageNamed:@"icon_point_red"]; ///定位图标, 与蓝色原点互斥
    [self.mapView updateUserLocationRepresentation:r];
}

-(void)setPointAnnotation{
    MAPointAnnotation *pointAnnotation = [[MAPointAnnotation alloc] init];
    pointAnnotation.coordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    pointAnnotation.title = @"方恒国际";
    pointAnnotation.subtitle = @"阜通东大街6号";
    self.mapView.centerCoordinate = CLLocationCoordinate2DMake(39.989631, 116.481018);
    [_mapView addAnnotation:pointAnnotation];
}

- (MAAnnotationView *)mapView:(MAMapView *)mapView viewForAnnotation:(id)annotation {
    if ([annotation isKindOfClass:[MAPointAnnotation class]]){
        static NSString *pointReuseIndentifier = @"pointReuseIndentifier";
        MAPinAnnotationView*annotationView = (MAPinAnnotationView*)[mapView dequeueReusableAnnotationViewWithIdentifier:pointReuseIndentifier];
        if (annotationView == nil){
            annotationView = [[MAPinAnnotationView alloc] initWithAnnotation:annotation reuseIdentifier:pointReuseIndentifier];
        }
        //        annotationView.frame = CGRectMake(0, 0, 100, 100);
        annotationView.canShowCallout= YES;       //设置气泡可以弹出，默认为NO
        annotationView.animatesDrop = YES;        //设置标注动画显示，默认为NO
        annotationView.draggable = YES;        //设置标注可以拖动，默认为NO
        annotationView.pinColor = MAPinAnnotationColorPurple;
        //        UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, 80, 50)];
        //        rightButton.backgroundColor = [UIColor grayColor];
        //        [rightButton setTitle:@"导航" forState:UIControlStateNormal];
        //        annotationView.rightCalloutAccessoryView = rightButton;
        return annotationView;
    }
    return nil;
}


- (void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation updatingLocation:(BOOL)updatingLocation {
    //userLocation 就是用户当前的位置信息，通过userLocation 可以获取当前的经纬度信息及详细的地理位置信息，方法如下：
    //创建一个经纬度点：
    MAPointAnnotation *point = [[MAPointAnnotation alloc] init];
    //设置点的经纬度
    point.coordinate = userLocation.location.coordinate;
    CLLocation *currentLocation = [[CLLocation alloc]initWithLatitude:userLocation.location.coordinate.latitude longitude:userLocation.location.coordinate.longitude];
    // 初始化编码器
    CLGeocoder *geoCoder = [[CLGeocoder alloc] init];
    [geoCoder reverseGeocodeLocation:currentLocation completionHandler:^(NSArray *placemarks, NSError *error) {
        //获取当前城市位置信息，其中CLPlacemark包括name、thoroughfare、subThoroughfare、locality、subLocality等详细信息
        CLPlacemark *mark = [placemarks lastObject];
        NSString *cityName = mark.locality;
        NSLog(@"城市 - %@", cityName);
        //        self.currentCity  = cityName;
    }];
}

- (void)driveManagerOnCalculateRouteSuccess:(AMapNaviDriveManager *)driveManager
{
    //算路成功后开始GPS导航
    NSLog(@"onCalculateRouteSuccess");
    [self.driveManager startGPSNavi];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
