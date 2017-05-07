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
#import "OrderTableViewCell.h"
#import "BaseTableView.h"

@interface OrderViewController () <JTSegmentControlDelegate,UITableViewDelegate, UITableViewDataSource,KBPlaceHolderTableViewDelegate> {
    NSMutableArray *dataArr;
}
@property(nonatomic,strong)BaseTableView *tableview;
@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title= @"单子";
    UIBarButtonItem *gpsBtn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_daohang"]
                                                            style:UIBarButtonItemStylePlain target:self action:@selector(toMapView)];
    
    self.navigationItem.rightBarButtonItem = gpsBtn;
    [self loadUI];
    
    self.view.backgroundColor=BG_COLOR;
    dataArr=[[NSMutableArray alloc]init];
    dataArr=[@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10] mutableCopy];
}

-(void)toMapView{
    GPSNaviViewController *vc=[[GPSNaviViewController alloc]init];
    vc.hidesBottomBarWhenPushed=YES;
    [self.navigationController pushViewController:vc animated:YES];
}

-(void)loadUI{
    _tableview = [[BaseTableView alloc] initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, SCREEN_HEIGHT-64-40-45) style:UITableViewStylePlain];
    [_tableview initRefresh];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.kbDelegate=self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.clipsToBounds = NO;
    _tableview.showsVerticalScrollIndicator=NO;
    [_tableview setBackgroundColor:[UIColor clearColor]];
    [_tableview setHeaderRefreshingTarget:self refreshingAction:@selector(loadData)];
    [self.view addSubview:_tableview];
    
    JTSegmentControl *segmentedControl = [[JTSegmentControl alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    segmentedControl.delegate = self;
    segmentedControl.items = @[@"待交接 ", @"待送达", @"已完成"];
    [segmentedControl showBridgeWithShow:true index:1];
    segmentedControl.autoScrollWhenIndexChange = false;
    [self.view addSubview:segmentedControl];
}

-(void)loadData{
//success
     [_tableview endHeaderRefreshing];
//failed
//    [_tableview endHeaderRefreshing];
}

#pragma mark - tableView delegate
- (UIView *)kbPlaceHolderTableView:(KBPlaceHolderTableView *)tableView{
    UIView *kbView=[[UIView alloc]initWithFrame:CGRectMake(0, 40, SCREEN_WIDTH, SCREEN_HEIGHT)];
    UILabel *kbpLabel=[[UILabel alloc]initWithFrame:CGRectMake(0, 130, SCREEN_WIDTH, 20)];
    [kbpLabel setTextAlignment:NSTextAlignmentCenter];
    [kbpLabel setFont:[UIFont systemFontOfSize:15]];
    [kbpLabel setTextColor:FONTCOLOR];
    [kbpLabel setText:@"meiyou"];
    [kbView addSubview:kbpLabel];
    return kbView;
}

#pragma mark - tableview delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 165.f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID=@"cellID";
    OrderTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(nil==cell){
        cell=[[OrderTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;

    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

//设置cell分割线做对齐
-(void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPat{
    if ([cell respondsToSelector:@selector(setLayoutMargins:)]) {
        [cell setLayoutMargins:UIEdgeInsetsZero];
    }
    if ([cell respondsToSelector:@selector(setSeparatorInset:)]){
        [cell setSeparatorInset:UIEdgeInsetsZero];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
