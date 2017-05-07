//
//  KBPlaceHolderTableView.h
//  KBTableViewPlaceHolderDemo
//
//  Created by KentonYu on 16/3/10.
//  Copyright © 2016年 KentonYu. All rights reserved.
//

#import <UIKit/UIKit.h>

@class KBPlaceHolderTableView;

@protocol KBPlaceHolderTableViewDelegate <NSObject>

- (UIView *)kbPlaceHolderTableView:(KBPlaceHolderTableView *)tableView;

@end

@interface KBPlaceHolderTableView : UITableView

@property (nonatomic, weak) id<KBPlaceHolderTableViewDelegate> kbDelegate;

@end
