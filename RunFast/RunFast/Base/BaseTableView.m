//
//  BaseTableView.m
//
//  Created by KentonYu on 16/3/11.
//  Copyright © 2016年 DreamTouch. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView

- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    self = [super initWithFrame:frame style:style];
    if(self) {
        [self initRefresh];
    }
    return self;
}
-(void)initRefresh {
    MJRefreshNormalHeader *header = [[MJRefreshNormalHeader alloc] init];
    header.arrowView.hidden = YES;
    [header setTitle:@"下拉刷新" forState:MJRefreshStateIdle];
    [header setTitle:@"释放刷新" forState:MJRefreshStatePulling];
    [header setTitle:@"刷新中..." forState:MJRefreshStateRefreshing];
    header.lastUpdatedTimeLabel.hidden = YES;
    self.mj_header = header;
    
    MJRefreshBackNormalFooter *footer = [[MJRefreshBackNormalFooter alloc] init];
    [footer setTitle:@"" forState:MJRefreshStateNoMoreData];
    [footer setTitle:@"上拉加载" forState:MJRefreshStateIdle];
    [footer setTitle:@"释放加载" forState:MJRefreshStatePulling];
    [footer setTitle:@"加载中..." forState:MJRefreshStateRefreshing];
    self.mj_footer = footer;
}
- (void)setHeaderRefreshingTarget:(id)target refreshingAction:(SEL)action {
    [self.mj_header setRefreshingTarget:target refreshingAction:action];
}

-(void)setFooterRefreshingTarget:(id)target refreshingAction:(SEL)action {
    [self.mj_footer setRefreshingTarget:target refreshingAction:action];
}

- (void)beginHeaderRefreshing {
    [self.mj_header beginRefreshing];
}

- (void)beginFooterRefreshing {
    [self.mj_footer beginRefreshing];
}

- (void)endHeaderRefreshing {
    [self.mj_header endRefreshing];
}

- (void)endFooterRefreshing {
    [self.mj_footer endRefreshing];
}

- (void)endFooterRefreshingWithNoMore {
    [self.mj_footer endRefreshingWithNoMoreData];
}

- (BOOL)isRefreshing {
    return [self.mj_header isRefreshing] || [self.mj_footer isRefreshing];
}

- (void)resetNoMoreData {
    self.mj_footer.hidden = NO;
    [self.mj_footer resetNoMoreData];
}

@end

