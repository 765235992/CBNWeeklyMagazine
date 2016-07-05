//
//  CBNArticleFootView.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/5.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNArticleFootView.h"
#import "CBNRecommendedAndCollectionAndShareView.h"

@interface CBNArticleFootView ()
@property (nonatomic, strong) UIButton *commentsButton;
@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) UILabel *commentsLabel;
@end

@implementation CBNArticleFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.lineImageView];
        [self addSubview:self.backgroundView];
        
        [self addSubview:self.commentsButton];
        self.dk_backgroundColorPicker = DKColorPickerWithColors(UIColorFromRGB(0xF3F6F6),UIColorFromRGB(0x1E1E1E),UIColorFromRGB(0xF3F6F6));

    }
    return self;
}
- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        
        self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 1)];
        
        _lineImageView.dk_backgroundColorPicker = DKColorPickerWithKey(文章详情推荐标签背景颜色);
    }
    
    return _lineImageView;
}
- (UIView *)backgroundView
{
    if (!_backgroundView) {
        
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        [self createViews];

    }
    
    return _backgroundView;
}
- (void)createViews
{
    CGFloat width = 12;
    
    NSArray *dayImageArray = @[[UIImage imageNamed:@"comment_Image_Day.png"],[UIImage imageNamed:@"collection_Image_Day.png"],[UIImage imageNamed:@"share_Image_Day.png"]];
    
    NSArray *nightImageArray =  @[[UIImage imageNamed:@"comment_Image_Night.png"],[UIImage imageNamed:@"collection_Image_Night.png"],[UIImage imageNamed:@"share_Image_Night.png"]];
    
    CGFloat height = self.frame.size.height*0.41;
    
    for (int i = 0; i < 3; i++) {
        
        UIButton *tempButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [tempButton dk_setBackgroundImage:DKImagePickerWithImages([dayImageArray objectAtIndex:i],[nightImageArray objectAtIndex:i],[dayImageArray objectAtIndex:i]) forState:UIControlStateNormal];
        
        tempButton.frame = CGRectMake(width, 0, height, height);
        
        width = width + tempButton.frame.size.height + 12;

        [_backgroundView addSubview:tempButton];
        
        tempButton.center = CGPointMake(tempButton.center.x, self.frame.size.height/2);
        
    }
    
    _backgroundView.frame = CGRectMake(self.frame.size.width - width, 0, width, self.frame.size.height);
    
}

- (UIButton *)commentsButton
{
    
    if (!_commentsButton) {
        
        self.commentsButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _commentsButton.frame = CGRectMake(12, self.frame.size.height*0.2-1, self.frame.size.width - _backgroundView.frame.size.width - 15, self.frame.size.height*0.6);
        _commentsButton.layer.dk_borderColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
        _commentsButton.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);
        
        _commentsButton.layer.borderWidth = 1;
        
        _commentsButton.layer.cornerRadius = _commentsButton.frame.size.height/2;
        
        [_commentsButton addSubview:self.commentsLabel];
        
        [_commentsButton addTarget:self action:@selector(commentsButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _commentsButton;
}
- (void)commentsButton:(UIButton *)sender
{
    if ([self.delegate respondsToSelector:@selector(commentsButtonClicked:)]) {
        
        [self.delegate commentsButtonClicked:sender];
        
    }
}
- (UILabel *)commentsLabel
{
    if (!_commentsLabel) {
        
        self.commentsLabel = [[UILabel alloc] initWithFrame:CGRectMake(_commentsButton.frame.size.height/1.75, 0, _commentsButton.frame.size.width - _commentsButton.frame.size.height*2, _commentsButton.frame.size.height)];
        
        _commentsLabel.text = @"添加评论… …";
        
        _commentsLabel.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
        
        _commentsLabel.font = font_px_Medium(12);
    }
    
    
    return _commentsLabel;
}




@end
