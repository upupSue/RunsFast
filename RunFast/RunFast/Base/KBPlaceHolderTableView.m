//
//  KBPlaceHolderTableView.m
//  KBTableViewPlaceHolderDemo
//
//  Created by KentonYu on 16/3/10.
//  Copyright © 2016年 KentonYu. All rights reserved.
//

#import "KBPlaceHolderTableView.h"

@interface KBPlaceHolderTableView ()

@property (nonatomic, strong) UIView *placeHolderView;

@end

@implementation KBPlaceHolderTableView

#pragma mark Super
- (void)reloadData {
    [super reloadData];
    [self p_isEmpty];
}

#pragma mark Pravite
- (void)p_isEmpty {
    
    BOOL isEmpty = YES;
    
    id<UITableViewDataSource> dataSourceDetagete = self.dataSource;
    
    NSInteger sectionsNum = 1; //默认是1
    if ([dataSourceDetagete respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        sectionsNum = [dataSourceDetagete numberOfSectionsInTableView:self];
    }
    for (int i = 0; i <= sectionsNum; i++) {
        //如果有不为0的 则设置空视图flag为NO
        if ([dataSourceDetagete tableView:self numberOfRowsInSection:i]) {
            isEmpty = NO;
        }
    }
    
    if (isEmpty) {
        if ([self.kbDelegate respondsToSelector:@selector(kbPlaceHolderTableView:)]) {
            if (self.placeHolderView) {
                [self.placeHolderView removeFromSuperview];
                self.placeHolderView = nil;
            }
            self.placeHolderView = [self.kbDelegate kbPlaceHolderTableView:self];
            CGRect placeHolderViewOldFrame = self.placeHolderView.frame;
            [self layoutIfNeeded];
            self.placeHolderView.frame = CGRectMake((self.frame.size.width-placeHolderViewOldFrame.size.width)/2.f, (self.frame.size.height-placeHolderViewOldFrame.size.height)/2.f, placeHolderViewOldFrame.size.width, placeHolderViewOldFrame.size.height);
            self.tableFooterView = [[UIView alloc] init];
            [self addSubview:self.placeHolderView];
        } else {
            NSString *selectorName = NSStringFromSelector(@selector(kbPlaceHolderTableView:));
            NSString *reason = [NSString stringWithFormat:@"You must implement makePlaceHolderView method in its delegate class if you want to use %@", selectorName];
            @throw [NSException exceptionWithName:NSGenericException
                                           reason:reason
                                         userInfo:nil];
        }
    } else {
        [self.placeHolderView removeFromSuperview];
        self.placeHolderView = nil;
    }
}

@end
