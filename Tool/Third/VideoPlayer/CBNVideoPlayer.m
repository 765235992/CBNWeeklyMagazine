//
//  CBNVideoPlayer.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/5.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNVideoPlayer.h"

@interface CBNVideoPlayer ()
@property (nonatomic, strong) UIButton *fullScreenButton;
@end

@implementation CBNVideoPlayer
- (void)dealloc
{
    CBNLog(@"%@CBNVideoPlayer");
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
    }
    return self;
}

@end
