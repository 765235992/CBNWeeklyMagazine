//
//  CBNUserCenterView.h
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/28.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CBNUserCenterView;

@protocol CBNUserCenterViewDelegate <NSObject>

- (void)userCenterDrawViewDidSelectedAtIndex:(NSInteger)index;

@end

@interface CBNUserCenterView : UIView
@property (nonatomic, assign) id <CBNUserCenterViewDelegate> delegate;
@end
