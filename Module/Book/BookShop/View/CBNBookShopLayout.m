//
//  CBNBookShopLayout.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookShopLayout.h"
//#define

@implementation CBNBookShopLayout
-(id)init
{
    self = [super init];
    if (self) {
        CGFloat imageHeight = (((screen_Width-36)/2)*1.25) + 8*screen_Width/320;
        CGFloat titleHeight = [NSString heightForStringFontSize:fontSize(48.0,42.0,38.0)]  + 8*screen_Width/320;
        CGFloat issueHeight = [NSString heightForStringFontSize:fontSize(42.0,38.0,34.0)];
        CGFloat timeHeight = [NSString heightForStringFontSize:fontSize(36.0,35.0,34.0)]-2*screen_Width/320;
        CGFloat width = (((screen_Width-36)/2));
        
        
        self.itemSize = CGSizeMake(width, imageHeight + titleHeight + issueHeight + timeHeight);
        
        NSLog(@"?? %f ",(imageHeight + titleHeight + issueHeight + timeHeight));
//        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        //  确定了缩进，此处为上方、下方各缩进200
        self.sectionInset = UIEdgeInsetsMake(12, 12, 12, 12);
        //  每个item在水平方向的最小间距
        self.minimumLineSpacing = 12;
        self.minimumInteritemSpacing = 12;
        NSLog(@"%f",(float)width);
    }
    return self;
}

@end
