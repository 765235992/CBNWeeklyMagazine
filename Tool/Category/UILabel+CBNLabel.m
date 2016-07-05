//
//  UILabel+CBNLabel.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "UILabel+CBNLabel.h"

@implementation UILabel (CBNLabel)
/*
 *  设置大标题
 */
- (NSAttributedString *)titleLabelAttributedStringWithString:(NSString *)string
{
    
    NSMutableParagraphStyle *paraStyle = [[NSMutableParagraphStyle alloc] init];
    
    /*
     *  设置对齐方式
     */
    paraStyle.alignment = NSTextAlignmentJustified;
    /*
     *  设置行间距
     */
    paraStyle.lineSpacing = 7;
    
    /*
     *  字符换行
     */
    paraStyle.lineBreakMode = NSLineBreakByCharWrapping;
    
    NSDictionary *attrDict = @{NSParagraphStyleAttributeName:paraStyle};
    
    NSAttributedString *attributedString = [[NSAttributedString alloc] initWithString:string attributes:attrDict];;
    
    return attributedString;
}
//- (float)heightForString:(NSString *)value fontSize:(float)fontSize andWidth:(float)width
//{
//    CGSize sizeToFit = [value sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(width, CGFLOAT_MAX) lineBreakMode:UILineBreakModeWordWrap];//此处的换行类型（lineBreakMode）可根据自己的实际情况进行设置
//    return sizeToFit.height;
//}
@end
