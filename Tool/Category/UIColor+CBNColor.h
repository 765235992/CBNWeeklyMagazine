//
//  UIColor+CBNColor.h
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (CBNColor)
- (UIImage *)colorImage;
+ (UIColor *)colorWithHexString:(NSString *)color;
+ (UIColor *)randomColor;
@end
