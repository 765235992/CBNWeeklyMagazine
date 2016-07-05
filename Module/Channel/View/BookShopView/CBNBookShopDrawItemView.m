//
//  CBNBookShopDrawItemView.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookShopDrawItemView.h"

@interface CBNBookShopDrawItemView ()
@property (nonatomic, strong) CBNImageView *newsThumbImageView;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UILabel *issueLabel;

@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation CBNBookShopDrawItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.newsThumbImageView];
        
        [self addSubview:self.timeLabel];
        
        [self addSubview:self.issueLabel];
        
        [self addSubview:self.titleLabel];
        
        self.userInteractionEnabled = YES;
        
    }
    return self;
}

- (CBNImageView *)newsThumbImageView
{
    if (!_newsThumbImageView) {
        
        self.newsThumbImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width*1.3)];
        
        _newsThumbImageView.backgroundColor = [UIColor clearColor];
        
        _newsThumbImageView.image = [UIImage imageNamed:@"defaultImage.jpg"];
    }
    
    return _newsThumbImageView;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        
        _timeLabel.numberOfLines = 1;
        
        _timeLabel.textAlignment = 1;
        
        _timeLabel.text = @"2016.16.20";
        
        _timeLabel.font = font_px_Medium(fontSize(40.0,40.0,36.0));
        
        _timeLabel.textColor = [UIColor whiteColor];
        
        [_timeLabel sizeToFit];
        
        _timeLabel.frame = CGRectMake(0, self.frame.size.height - _timeLabel.frame.size.height, self.frame.size.width, _timeLabel.frame.size.height);
        

    }
    
    return _timeLabel;
}
- (UILabel *)issueLabel
{
    if (!_issueLabel) {
        
        self.issueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        
        _issueLabel.numberOfLines = 1;
        
        _issueLabel.textAlignment = 1;
        
        _issueLabel.text = @"NO.1092";
        
        _issueLabel.font = font_px_Medium(fontSize(40.0,40.0,36.0));
        
        _issueLabel.textColor = [UIColor whiteColor];
        
        [_issueLabel sizeToFit];
        
        _issueLabel.frame = CGRectMake(0, self.frame.size.height - _issueLabel.frame.size.height - _issueLabel.frame.size.height , self.frame.size.width, _issueLabel.frame.size.height);
        
        
    }
    
    return _issueLabel;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _newsThumbImageView.frame.size.height + 5, self.frame.size.width, self.frame.size.height - (_newsThumbImageView.frame.size.height + 5)-_issueLabel.frame.size.height- _timeLabel.frame.size.height)];
        
        _titleLabel.numberOfLines = 2;
        
        _titleLabel.textAlignment = 1;
        
        _titleLabel.text = @"到日本去了";
        
        _titleLabel.font = font_px_Medium(fontSize(48.0,40.0,36.0));
        
        _titleLabel.textColor = [UIColor whiteColor];
        
        

    }
    
    return _titleLabel;
}
@end
