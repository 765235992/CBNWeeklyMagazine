//
//  CBNRecommendedAndCollectionAndShareView.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/29.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNRecommendedAndCollectionAndShareView.h"

@implementation CBNRecommendedAndCollectionAndShareView

- (id)initWithFrame:(CGRect)frame andClearance:(CGFloat)clearance
{
    self = [super initWithFrame:frame];
    if (self) {
        CGFloat width = clearance;
        
        NSArray *dayImageArray = @[[UIImage imageNamed:@"love_Image_Day.png"],[UIImage imageNamed:@"collection_Image_Day.png"],[UIImage imageNamed:@"share_Image_Day.png"]];
        
        NSArray *nightImageArray =  @[[UIImage imageNamed:@"love_Image_Night.png"],[UIImage imageNamed:@"collection_Image_Night.png"],[UIImage imageNamed:@"share_Image_Night.png"]];

        for (int i = 0; i < 3; i++) {
            
            UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [tempButton dk_setBackgroundImage:DKImagePickerWithImages([dayImageArray objectAtIndex:i],[nightImageArray objectAtIndex:i],[dayImageArray objectAtIndex:i]) forState:UIControlStateNormal];
            tempButton.frame = CGRectMake(width, 0, self.frame.size.height, self.frame.size.height);
            
            width = width + tempButton.frame.size.height +clearance;
            
            [self addSubview:tempButton];

        }

        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, self.frame.size.height);

    }
    return self;
}

@end
