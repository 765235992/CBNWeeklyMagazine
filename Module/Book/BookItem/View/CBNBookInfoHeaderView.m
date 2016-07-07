//
//  CBNBookInfoHeaderView.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookInfoHeaderView.h"

#define   image_width  (((screen_Width-36)/2))

@interface CBNBookInfoHeaderView ()

@property (nonatomic, strong) CBNImageView *bookImageView;

@property (nonatomic, strong) UILabel *bookTitleLabel;

@property (nonatomic, strong) UILabel *issueIDLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@property (nonatomic, strong) UIButton *nextButton;

@property (nonatomic, strong) UIImageView *lineImageView;

@end

@implementation CBNBookInfoHeaderView

- (void)dealloc
{
    NSLog(@"释放");
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        
        [self addSubview:self.bookImageView];
        
        [self addSubview:self.bookTitleLabel];
        
        [self addSubview:self.issueIDLabel];
        
        [self addSubview:self.timeLabel];
        
        [self addSubview:self.nextButton];
        
        [self addSubview:self.lineImageView];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _lineImageView.frame.size.height + _lineImageView.frame.origin.y + 20);
        
        NSLog(@"adsa  %@",self);
        
    }
    return self;
}

- (CBNImageView *)bookImageView
{
    if (!_bookImageView) {
        
        self.bookImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(0, 20, image_width, image_width*1.25)];
        
        _bookImageView.center = CGPointMake(screen_Width/2, _bookImageView.center.y);
        
        _bookImageView.backgroundColor = [UIColor orangeColor];
        
    }
    
    return _bookImageView;
}
- (UILabel *)bookTitleLabel
{
    if (!_bookTitleLabel) {
        
        self.bookTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _bookImageView.frame.size.height + 8*screen_Width/320 + _bookImageView.frame.origin.y, image_width, 0)];
        
        _bookTitleLabel.backgroundColor = [UIColor clearColor];
        
        _bookTitleLabel.font =font_px_Medium(fontSize(48.0,42.0,38.0));
        
        _bookTitleLabel.numberOfLines = 1;
        
        _bookTitleLabel.textAlignment = 1;
        
        _bookTitleLabel.text = @"--";
        _bookTitleLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);

        [_bookTitleLabel sizeToFit];
        _bookTitleLabel.frame = CGRectMake(_bookTitleLabel.frame.origin.x, _bookTitleLabel.frame.origin.y, image_width, _bookTitleLabel.frame.size.height);
        _bookTitleLabel.center = CGPointMake(screen_Width/2, _bookTitleLabel.center.y);

    }
    
    return _bookTitleLabel;
}

- (UILabel *)issueIDLabel
{
    if (!_issueIDLabel) {
        
        self.issueIDLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _bookTitleLabel.frame.size.height + _bookTitleLabel.frame.origin.y, image_width, 0)];
        
        _issueIDLabel.font =font_px_Medium(fontSize(42.0,38.0,34.0));
        
        _issueIDLabel.numberOfLines = 1;
        
        _issueIDLabel.textAlignment = 1;
        
        _issueIDLabel.text = @"--";
        _issueIDLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);

        [_issueIDLabel sizeToFit];
        _issueIDLabel.frame = CGRectMake(_issueIDLabel.frame.origin.x, _issueIDLabel.frame.origin.y, image_width, _issueIDLabel.frame.size.height);
        _issueIDLabel.center = CGPointMake(screen_Width/2, _issueIDLabel.center.y);

    }
    
    return _issueIDLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _issueIDLabel.frame.size.height + _issueIDLabel.frame.origin.y-2*screen_Width/320, image_width, 0)];
        
        _timeLabel.font =font_px_Medium(fontSize(36.0,35.0,34.0));
        
        _timeLabel.numberOfLines = 1;
        
        _timeLabel.textAlignment = 1;
        
        _timeLabel.text = @"--";

        _timeLabel.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
        [_timeLabel sizeToFit];
        _timeLabel.frame = CGRectMake(_timeLabel.frame.origin.x, _timeLabel.frame.origin.y, image_width, _timeLabel.frame.size.height);
        _timeLabel.center = CGPointMake(screen_Width/2, _timeLabel.center.y);

    }
    
    return _timeLabel;
}
- (UIButton *)nextButton
{
    if (!_nextButton) {
        
        self.nextButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _nextButton.frame = CGRectMake(0, _timeLabel.frame.size.height + _timeLabel.frame.origin.y + 7*screen_Width/320, image_width*0.5, 20*screen_Width/320);
        
        [_nextButton setTitle:@"下载" forState:UIControlStateNormal];
        
        [_nextButton dk_setTitleColorPicker:DKColorPickerWithKey(白色背景上的默认标签字体颜色) forState:UIControlStateNormal];
        
        _nextButton.layer.dk_borderColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
        _nextButton.layer.borderWidth = 1;
        
        _nextButton.layer.cornerRadius = _nextButton.frame.size.height/2;

        _nextButton.center = CGPointMake(screen_Width/2, _nextButton.center.y);

    }
    
    return _nextButton;
}

- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        
        self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, _nextButton.frame.size.height + _nextButton.frame.origin.y + 12*screen_Width/320, screen_Width-24, 1)];
        
        _lineImageView.backgroundColor = [UIColor redColor];
    }
    
    return _lineImageView;
}
- (void)setBookShopItemModel:(CBNBookShopItemModel *)bookShopItemModel
{
    _bookShopItemModel = bookShopItemModel;
    [_bookImageView sd_setImageWithURL:[NSURL URLWithString:bookShopItemModel.cover_img] placeholderImage:nil];
    
    _bookTitleLabel.text = bookShopItemModel.maga_note;
    
    _issueIDLabel.text = [NSString stringWithFormat:@"NO.%@",bookShopItemModel.maga_all_number];
    
    _timeLabel.text = [NSDate pointStandardDateChangeToNeedTime: bookShopItemModel.maga_time];
    
    
    
    
}


@end
