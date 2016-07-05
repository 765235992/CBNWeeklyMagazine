//
//  CBNColumnItemView.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/4.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNColumnItemView.h"
#define clearn 12*screen_Width/320
@interface CBNColumnItemView ()
@property (nonatomic, strong) UIImageView *columnItemLineImageView;
@property (nonatomic, strong) UILabel *columnNameLabel;
@end

@implementation CBNColumnItemView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.columnItemLineImageView];
        
        [self addSubview:self.columnNameLabel];
    }
    return self;
}

- (UIImageView *)columnItemLineImageView
{
    if (!_columnItemLineImageView) {
        
        self.columnItemLineImageView = [[UIImageView alloc] init];
        
        CGFloat height = [NSString heightForStringFontSize:fontSize(48.0,40.0,38.0)];
        
        _columnItemLineImageView.frame = CGRectMake(clearn, (self.frame.size.height -height)/2 , 2*screen_Width/320, height);
        
    }
    
    return _columnItemLineImageView;
}

- (UILabel *)columnNameLabel
{
    if (!_columnNameLabel) {
        
        self.columnNameLabel = [[UILabel alloc] init];
        
        _columnNameLabel.font = font_px_Medium(fontSize(46.0,40.0,32.0));
        
        _columnNameLabel.numberOfLines = 1;
        
    }
    
    return _columnNameLabel;
}
- (void)setColumnModel:(CBNChannelColumnModel *)columnModel
{
    _columnItemLineImageView.backgroundColor = [UIColor colorWithHexString:columnModel.color];
    _columnNameLabel.text = columnModel.name;
    
    _columnNameLabel.textColor = [UIColor colorWithHexString:columnModel.color];
    
    [_columnNameLabel sizeToFit];
    
    _columnNameLabel.frame = CGRectMake(_columnItemLineImageView.frame.size.width + _columnItemLineImageView.frame.origin.x +clearn/1.3, 0, _columnNameLabel.frame.size.width, _columnNameLabel.frame.size.height);
    
    _columnNameLabel.center = CGPointMake(_columnNameLabel.center.x, self.frame.size.height/2);
};


@end
