//
//  CBNRelatedNewsLayout.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/29.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNRelatedNewsLayout.h"
#define width (((screen_Width*0.37 )))
#define height  width * 0.58
@implementation CBNRelatedNewsLayout
-(id)init
{
    self = [super init];
    if (self) {
        
        self.itemSize = CGSizeMake((float)width, (float)height);
        
        self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        
        //  确定了缩进，此处为上方、下方各缩进200
        self.sectionInset = UIEdgeInsetsMake(0, 0, 0, 0);
        
        //  每个item在水平方向的最小间距
        self.minimumLineSpacing = 0;

    }
    return self;
}
@end
