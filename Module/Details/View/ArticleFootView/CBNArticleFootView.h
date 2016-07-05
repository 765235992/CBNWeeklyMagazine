//
//  CBNArticleFootView.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/5.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBNArticleFootView;
@protocol CBNArticleFootViewDelegate <NSObject>

- (void)commentsButtonClicked:(UIButton *)sender;

@end

@interface CBNArticleFootView : UIView
@property (nonatomic, assign) id <CBNArticleFootViewDelegate> delegate;
@end
