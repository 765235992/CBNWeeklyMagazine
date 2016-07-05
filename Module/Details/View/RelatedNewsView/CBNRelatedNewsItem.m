//
//  CBNRelatedNewsItem.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/29.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNRelatedNewsItem.h"

@implementation CBNRelatedNewsItem
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        [self.contentView addSubview:self.relatedNewsImageView];;
        self.dk_backgroundColorPicker = DKColorPickerWithRGB(0xf2f2f2,0x000000,0xFFFFFF);

        self.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (CBNImageView *)relatedNewsImageView
{
    if (!_relatedNewsImageView) {
        
        self.relatedNewsImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(0.0, 0.0, self.frame.size.width, self.frame.size.height)];
        
        _relatedNewsImageView.autoresizingMask = UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth;
        
        _relatedNewsImageView.image = [UIImage imageNamed:@"defaultImage.jpg"];
    }
    
    return _relatedNewsImageView;
}

@end
