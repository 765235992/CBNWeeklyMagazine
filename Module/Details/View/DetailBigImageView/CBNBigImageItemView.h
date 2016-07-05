//
//  CBNBigImageItemView.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/5.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CBNBigImageItemView;

typedef void(^oneClicked)(CBNBigImageItemView *imageCell);

typedef void(^longPress)(CBNBigImageItemView *imageCell);
@interface CBNBigImageItemView : UIScrollView
@property (nonatomic, copy) oneClicked oneClicked;

@property (nonatomic, copy) longPress longPress;

@property (nonatomic, strong) NSString *imageURL;
- (instancetype)initWithFrame:(CGRect)frame andImage:(UIImage *)image;


/*
 手势识别的结果
 oneClicked 单击
 longPress 长按
 */
- (void)gesturesResultsOneClcked:(oneClicked)oneClicked longPress:(longPress)longPress ;
/*
 图片复原
 */
- (void)restoreImage;
@end
