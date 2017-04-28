//
//  HomeViewController.m
//  RunFast
//
//  Created by 方琼蔚 on 17/4/22.
//  Copyright © 2017年 方琼蔚. All rights reserved.
//

#import "HomeViewController.h"
#import "HomeTableViewCell.h"

@interface HomeViewController ()<UITableViewDelegate, UITableViewDataSource> {
    NSMutableArray *dataArr;
}

@property(nonatomic,strong)UITableView *tableview;

@end

@implementation HomeViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationItem.title= @"跑得快";
    self.view.backgroundColor=BG_COLOR;
    dataArr=[[NSMutableArray alloc]init];
    dataArr=[@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10] mutableCopy];
    [self loadUI];
}

- (void)viewWillAppear:(BOOL)animated{
    [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
}

-(void)loadUI{
    _tableview = [[UITableView alloc] initWithFrame:CGRectMake(20, 0, SCREEN_WIDTH-40, SCREEN_HEIGHT-64-44) style:UITableViewStylePlain];
    _tableview.delegate = self;
    _tableview.dataSource = self;
    _tableview.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableview.clipsToBounds = NO;
    _tableview.showsVerticalScrollIndicator=NO;
    [_tableview setBackgroundColor:[UIColor clearColor]];
    [self.view addSubview:_tableview];
}

#pragma mark - tableview delegate

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return dataArr.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 128.f;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID=@"cellID";
    HomeTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if(nil==cell){
        cell=[[HomeTableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    cell.getbtn.clickButton = ^(){
        [dataArr removeObjectAtIndex:indexPath.row];
        [_tableview beginUpdates];
        [_tableview deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath] withRowAnimation:UITableViewRowAnimationTop];
        [_tableview endUpdates];
        [_tableview reloadData];
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
