//
//  CBNLogoView.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNLogoView.h"
@interface CBNLogoView ()
@property (nonatomic, strong) UIButton *lefeButton;
@property (nonatomic, strong) UIButton *rightButton;
@property (nonatomic, strong) UIImageView *logoImageView;
@property (nonatomic, strong) UIVisualEffectView *visualEffectView;
@end

@implementation CBNLogoView
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dayAndNightChange) name:@"dayAndNightChange" object:nil];

        self.userInteractionEnabled = YES;
        [self addSubview:self.visualEffectView];
        [self addSubview:self.lefeButton];
        
        [self addSubview:self.rightButton];
        
        [self addSubview:self.logoImageView];
        
        [self dayAndNightChange];
        
    }
    return self;
}
- (UIVisualEffectView *)visualEffectView
{
    if (!_visualEffectView) {
        
        self.visualEffectView = [[UIVisualEffectView alloc] initWithFrame:self.bounds];
        
        
    }
    
    return _visualEffectView;
}
- (void)dayAndNightChange
{
    if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNight]) {
        
        [self night];

    } else {
        [self day];

    }

}
- (void)night
{
    self.visualEffectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
    self.backgroundColor = [UIColor colorWithRed:3/255.0 green:3/255.0 blue:3/255.0 alpha:0.8];
}
- (void)day
{
    self.visualEffectView.effect = [UIBlurEffect effectWithStyle:UIBlurEffectStyleLight];
    self.backgroundColor = [UIColor colorWithRed:233/255.0 green:233/255.0 blue:233/255.0 alpha:0.9];
}

- (UIButton *)lefeButton
{
    if (!_lefeButton) {
        
        self.lefeButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _lefeButton.frame = CGRectMake(10, 30, 25, 25);
        
        [_lefeButton setImage:[UIImage imageNamed:@"user_Center_Day.png"] forState:UIControlStateNormal];
        
        [_lefeButton addTarget:self action:@selector(lefeButton:) forControlEvents:UIControlEventTouchUpInside];

    }
    
    return _lefeButton;
}
- (void)lefeButton:(UIButton *)sender
{
    
    
    if ([self.delegate respondsToSelector:@selector(userCenterAction)]) {
        [self.delegate userCenterAction];
    }

}

- (UIButton *)rightButton
{
    if (!_rightButton) {
        
        self.rightButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _rightButton.frame = CGRectMake(screen_Width-40, 30, 25, 25);
        
        [_rightButton setImage:[UIImage imageNamed:@"book_Shop_Day.png"] forState:UIControlStateNormal];
        
        [_rightButton addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _rightButton;
}
- (void)rightButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(bookShopAction)]) {
        
        [self.delegate bookShopAction];
    }
}
- (UIImageView *)logoImageView
{
    if (!_logoImageView) {
        
        self.logoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 20, 133, 44)];
        
        _logoImageView.image = [UIImage imageNamed:@"navigation_Logo_Day.png"];
        _logoImageView.center = CGPointMake(screen_Width/2, _logoImageView.center.y);
    }
    
    return _logoImageView;
}

@end
