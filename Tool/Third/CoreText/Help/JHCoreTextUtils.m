//
//  JHCoreTextUtils.m
//  自定义Label
//
//  Created by huaxianwei on 16/5/26.
//  Copyright © 2016年 Jim. All rights reserved.
//

#import "JHCoreTextUtils.h"

@implementation JHCoreTextUtils
+ (JHCoreTextButtonData *)touchButtonInView:(UIView *)view atPoint:(CGPoint)point data:(JHCoreTextData *)data
{
    CFIndex idx = [self touchContentOffsetInView:view atPoint:point data:data];
    if (idx == -1) {
        return nil;
    }
    JHCoreTextButtonData * foundLink = [self buttonAtIndex:idx buttonArray:data.buttonArray];
    return foundLink;

}
+ (JHCoreTextButtonData *)buttonAtIndex:(CFIndex)i buttonArray:(NSArray *)buttonArray {
    JHCoreTextButtonData *link = nil;
    for (JHCoreTextButtonData *data in buttonArray) {
        if (NSLocationInRange(i, data.range)) {
            link = data;
            break;
        }
    }
    return link;
}


// 将点击的位置转换成字符串的偏移量，如果没有找到，则返回-1
+ (CFIndex)touchContentOffsetInView:(UIView *)view atPoint:(CGPoint)point data:(JHCoreTextData *)data {
    CTFrameRef textFrame = data.ctFrame;
    CFArrayRef lines = CTFrameGetLines(textFrame);
    if (!lines) {
        return -1;
    }
    CFIndex count = CFArrayGetCount(lines);
    
    // 获得每一行的origin坐标
    CGPoint origins[count];
    CTFrameGetLineOrigins(textFrame, CFRangeMake(0,0), origins);
    
    // 翻转坐标系
    CGAffineTransform transform =  CGAffineTransformMakeTranslation(0, view.bounds.size.height);
    transform = CGAffineTransformScale(transform, 1.f, -1.f);
    
    CFIndex idx = -1;
    for (int i = 0; i < count; i++) {
        CGPoint linePoint = origins[i];
        CTLineRef line = CFArrayGetValueAtIndex(lines, i);
        // 获得每一行的CGRect信息
        CGRect flippedRect = [self getLineBounds:line point:linePoint];
        CGRect rect = CGRectApplyAffineTransform(flippedRect, transform);
        
        if (CGRectContainsPoint(rect, point)) {
            // 将点击的坐标转换成相对于当前行的坐标
            CGPoint relativePoint = CGPointMake(point.x-CGRectGetMinX(rect),
                                                point.y-CGRectGetMinY(rect));
            // 获得当前点击坐标对应的字符串偏移
            idx = CTLineGetStringIndexForPosition(line, relativePoint);
        }
    }
    return idx;
}
+ (CGRect)getLineBounds:(CTLineRef)line point:(CGPoint)point {
    CGFloat ascent = 0.0f;
    CGFloat descent = 0.0f;
    CGFloat leading = 0.0f;
    CGFloat width = (CGFloat)CTLineGetTypographicBounds(line, &ascent, &descent, &leading);
    CGFloat height = ascent + descent;
    return CGRectMake(point.x, point.y - descent, width, height);
}



@end
