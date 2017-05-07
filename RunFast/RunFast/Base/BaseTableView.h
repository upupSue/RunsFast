//
//  BaseTableView.h
//
//  Created by KentonYu on 16/3/11.
//  Copyright © 2016年 DreamTouch. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "KBPlaceHolderTableView.h"
#import <MJRefresh/MJRefresh.h>
@interface BaseTableView : KBPlaceHolderTableView

-(void)initRefresh;
/**
 *  header pull to refresh
 */
- (void)setHeaderRefreshingTarget:(id)target refreshingAction:(SEL)action;

/**
 *  footer pull to refresh
 */
- (void)setFooterRefreshingTarget:(id)target refreshingAction:(SEL)action;

/**
 *  header开始刷新，会调用refreshingAction
 */
- (void)beginHeaderRefreshing;

/**
 *  footer开始刷新，会调用refreshingAction
 */
- (void)beginFooterRefreshing;

/**
 *  header结束刷新
 */
- (void)endHeaderRefreshing;

/**
 *  footer结束刷新
 */
- (void)endFooterRefreshing;

/**
 *  footer结束刷新后隐藏
 */
- (void)endFooterRefreshingWithNoMore;

/**
 *  判断header或者footer是否在刷新中
 */
- (BOOL)isRefreshing;

/**
 *  重置footer状态
 */
- (void)resetNoMoreData;

@end
