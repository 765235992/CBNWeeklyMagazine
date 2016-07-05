//
//  CBNRecommendHeaderView.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNRecommendHeaderView.h"

@implementation CBNRecommendHeaderView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.sliderView];
        
    }
    return self;
}

- (CBNRecommendSliderView *)sliderView
{
    if (!_sliderView) {
        
        self.sliderView = [[CBNRecommendSliderView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
        _sliderView.backgroundColor = [UIColor redColor];
        
    }
    return _sliderView;
}
@end
