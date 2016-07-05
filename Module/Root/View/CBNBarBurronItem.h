//
//  CBNBarBurronItem.h
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DKNightVersion.h"

@interface CBNBarBurronItem : UIBarButtonItem
-(instancetype)initWithTarget:(id)target action:(SEL)action andFrame:(CGRect)rect andImage:(UIImage *)image;
-(instancetype)initWithTarget:(id)target action:(SEL)action andFrame:(CGRect)rect andImagePicker:(DKImagePicker)imagePicker;
@end
