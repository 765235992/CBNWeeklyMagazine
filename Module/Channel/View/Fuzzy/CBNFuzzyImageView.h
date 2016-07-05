//
//  CBNFuzzyImageView.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CBNFuzzyImageView;

@protocol CBNFuzzyImageViewDelegate <NSObject>

- (void)cleanFuzzyImageView;

@end


@interface CBNFuzzyImageView : UIImageView<UIGestureRecognizerDelegate>

@property (nonatomic, assign) id <CBNFuzzyImageViewDelegate> delegate;

@end
