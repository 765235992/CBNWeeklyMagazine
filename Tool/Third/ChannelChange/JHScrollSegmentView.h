//
//  JHScrollSegmentView.h
//  频道切换
//
//  Created by 滑现伟 on 16/5/17.
//  Copyright © 2016年 Aubrey. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHSegmentStyle.h"
typedef void(^TitleBtnOnClickBlock)(UILabel *label, NSInteger index);
typedef void(^ExtraBtnOnClick)(UIButton *extraBtn);

@interface JHScrollSegmentView : UIView
@property (copy, nonatomic) ExtraBtnOnClick extraBtnOnClick;

@property (strong, nonatomic) UIImage *backgroundImage;

- (instancetype)initWithFrame:(CGRect )frame segmentStyle:(JHSegmentStyle *)segmentStyle titles:(NSArray *)titles titleDidClick:(TitleBtnOnClickBlock)titleDidClick;
/*
 * 点击按钮的时候调整UI
 */
- (void)adjustUIWhenBtnOnClickWithAnimate:(BOOL)animated;
/*
 * 切换下标的时候根据progress同步设置UI
 */
- (void)adjustUIWithProgress:(CGFloat)progress oldIndex:(NSInteger)oldIndex currentIndex:(NSInteger)currentIndex;
/*
 * 让选中的标题居中
 */
- (void)adjustTitleOffSetToCurrentIndex:(NSInteger)currentIndex;
/*
 * 设置选中的下标
 */
- (void)setSelectedIndex:(NSInteger)index animated:(BOOL)animated;
/*
 * 重新刷新标题的内容
 */
- (void)reloadTitlesWithNewTitles:(NSArray *)titles;

@end
