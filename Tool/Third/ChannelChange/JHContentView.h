//
//  JHContentView.h
//  频道切换
//
//  Created by 滑现伟 on 16/5/17.
//  Copyright © 2016年 Aubrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHScrollSegmentView.h"

typedef void(^contentViewAtNewIndex)(NSInteger index);
@interface JHContentView : UIView
- (instancetype)initWithFrame:(CGRect)frame childVcs:(NSArray *)childVcs segmentView:(JHScrollSegmentView *)segmentView parentViewController:(UIViewController *)parentViewController;


/*
 * 给外界可以设置ContentOffSet的方法
 */
- (void)setContentOffSet:(CGPoint)offset animated:(BOOL)animated;
/*
 * 给外界刷新视图的方法
 */
- (void)reloadAllViewsWithNewChildVcs:(NSArray *)newChileVcs;

@end
