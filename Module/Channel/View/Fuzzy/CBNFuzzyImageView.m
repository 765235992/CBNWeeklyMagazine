//
//  CBNFuzzyImageView.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNFuzzyImageView.h"

@interface CBNFuzzyImageView ()

@end

@implementation CBNFuzzyImageView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.userInteractionEnabled = YES;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(closeDraw:)];
        
        tap.numberOfTapsRequired = 1;
        
        tap.delegate = self;
        
        [self addGestureRecognizer:tap];
        
    }
    return self;
}
- (void)closeDraw:(CBNFuzzyImageView *)sender
{
    
    if ([self.delegate respondsToSelector:@selector(cleanFuzzyImageView)]) {
        
        [self.delegate cleanFuzzyImageView];
        
    }
}
@end
