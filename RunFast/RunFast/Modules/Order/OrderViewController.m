//
//  OrderViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/27.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "OrderViewController.h"
#import "GPSNaviViewController.h"
#import "RunFast-swift.h"
#import "OrderTableViewCell.h"
#import "SVPullToRefresh.h"
#import "ViewWithCurve.h"
#import "OrderModel.h"
@interface OrderViewController () <JTSegmentControlDelegate,UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *dataArr;
    JTSegmentControl *segmentedControl;
    OrderModel *orderModel;
}
@property(nonatomic,strong)UITableView *tableview;
@end

@implementation OrderViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title= @"单子";
    UIBarButtonItem *gpsBtn=[[UIBarButtonItem alloc]initWithImage:[UIImage imageNamed:@"icon_daohang"] style:UIBarButtonItemStylePlain target:self action:@selector(toMapView)];
    
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
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(0, 45, SCREEN_WIDTH, SCREEN_HEIGHT-64-40-45) style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.clipsToBounds = NO;
    _tableview.showsVerticalScrollIndicator=NO;
    [_tableview setBackgroundColor:[UIColor clearColor]];

    __weak typeof(self) weakSelf = self;
    [_tableview addPullToRefreshWithActionHandler:^{
//        [weakSelf refreshTableView];
        //3秒后调用refreshTableView方法
        [weakSelf performSelector:@selector(loadData) withObject:nil afterDelay:1.0];
        //风火轮的动画还需要我们手动的停止

    }];
    ViewWithCurve *tView=[[ViewWithCurve alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) Type:1 color:[UIColor redColor]];
    tView.backgroundColor=[UIColor clearColor];
    ViewWithCurve *aView=[[ViewWithCurve alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) Type:2 color:[UIColor colorWithRed: 0.186 green: 0.643 blue: 0.667 alpha: 1]];
    aView.backgroundColor=[UIColor clearColor];
    ViewWithCurve *bView=[[ViewWithCurve alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 40) Type:3 color:[UIColor colorWithRed: 0.771 green: 0.842 blue: 0.477 alpha: 1]];
    bView.backgroundColor=[UIColor clearColor];
//    [_tableview.pullToRefreshView setTitle:@"下拉以刷新" forState:SVPullToRefreshStateTriggered];
//    [_tableview.pullToRefreshView setTitle:@"刷新完了呀" forState:SVPullToRefreshStateStopped];
//    [_tableview.pullToRefreshView setTitle:@"不要命的加载中..." forState:SVPullToRefreshStateLoading];
    [_tableview.pullToRefreshView setCustomView:aView forState:SVPullToRefreshStateTriggered];
    [_tableview.pullToRefreshView setCustomView:bView forState:SVPullToRefreshStateStopped];
    [_tableview.pullToRefreshView setCustomView:tView forState:SVPullToRefreshStateLoading];

    [_tableview triggerPullToRefresh];
    [self.view addSubview:_tableview];
        
    segmentedControl = [[JTSegmentControl alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 44)];
    segmentedControl.delegate = self;
    segmentedControl.items = @[@"待交接 ", @"待送达", @"已完成"];
    [segmentedControl showBridgeWithShow:true index:1];
    segmentedControl.autoScrollWhenIndexChange = false;
    [self.view addSubview:segmentedControl];
}

-(void)loadData{
    NSMutableDictionary *parameter = [[NSMutableDictionary alloc]init];
//    [parameter setObject:[UserDefaultsUtils valueWithKey:@"userId"] forKey:@"userid"];
    switch (_orderState) {
        case 1:
            [parameter setObject:@1 forKey:@"liststate"];
            break;
        case 2:
            [parameter setObject:@2 forKey:@"liststate"];
            break;
        case 3:
            [parameter setObject:@3 forKey:@"liststate"];
            break;
        case 4:
            [parameter setObject:@4 forKey:@"liststate"];
            break;
            
        default:
            break;
    }
    [HandlerBusiness ServiceWithApicode:ApiGetPickedUpOrder Parameters:parameter Success:^(id data, id msg){
        DBG(@"Success");
        [_tableview.pullToRefreshView stopAnimating];
        orderModel = (OrderModel *)data;
        [_tableview reloadData];
        
    }Failed:^(NSInteger code ,id errorMsg){
        DBG(@"failed");
        UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:nil message:errorMsg preferredStyle:UIAlertControllerStyleAlert];
        [alertVC setDismissInterval:kTimeSpan];
        [self presentViewController:alertVC animated:YES completion:nil];
    }Complete:^{
        [_tableview.pullToRefreshView stopAnimating];
    }];

}

-(void)refreshTableView{
    [self loadData];
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
    cell.block= ^{
        [segmentedControl moveTo:1 animated:YES];
    };
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
