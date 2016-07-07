//
//  CBNBookShopItemCell.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookShopItemCell.h"

@interface CBNBookShopItemCell ()
@property (nonatomic, strong) CBNImageView *bookImageView;

@property (nonatomic, strong) UILabel *bookTitleLabel;

@property (nonatomic, strong) UILabel *issueIDLabel;

@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation CBNBookShopItemCell
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
        
//        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _timeLabel.frame.size.height + _timeLabel.frame.origin.y);
        
        NSLog(@"adsa  %@",self);

    }
    return self;
}

- (CBNImageView *)bookImageView
{
    if (!_bookImageView) {
        
        self.bookImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.width*1.25)];
        _bookImageView.backgroundColor = [UIColor orangeColor];
        
    }
    
    return _bookImageView;
}
- (UILabel *)bookTitleLabel
{
    if (!_bookTitleLabel) {
        
        self.bookTitleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _bookImageView.frame.size.height + 8*screen_Width/320, self.frame.size.width, 0)];
        
        _bookTitleLabel.backgroundColor = [UIColor clearColor];
        
        _bookTitleLabel.font =font_px_Medium(fontSize(48.0,42.0,38.0));
        
        _bookTitleLabel.numberOfLines = 1;
        
        _bookTitleLabel.textAlignment = 1;
        
        _bookTitleLabel.text = @"--";
        _bookTitleLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
        [_bookTitleLabel sizeToFit];
        _bookTitleLabel.frame = CGRectMake(_bookTitleLabel.frame.origin.x, _bookTitleLabel.frame.origin.y, self.frame.size.width, _bookTitleLabel.frame.size.height);
    }
    
    return _bookTitleLabel;
}

- (UILabel *)issueIDLabel
{
    if (!_issueIDLabel) {
        
        self.issueIDLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _bookTitleLabel.frame.size.height + _bookTitleLabel.frame.origin.y, self.frame.size.width, 0)];
        
        _issueIDLabel.font =font_px_Medium(fontSize(42.0,38.0,34.0));
        
        _issueIDLabel.numberOfLines = 1;
        
        _issueIDLabel.textAlignment = 1;
        
        _issueIDLabel.text = @"NO.987";
        _issueIDLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);

        [_issueIDLabel sizeToFit];
        _issueIDLabel.frame = CGRectMake(_issueIDLabel.frame.origin.x, _issueIDLabel.frame.origin.y, self.frame.size.width, _issueIDLabel.frame.size.height);
    }
    
    return _issueIDLabel;
}
- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, _issueIDLabel.frame.size.height + _issueIDLabel.frame.origin.y-2*screen_Width/320, self.frame.size.width, 0)];
        
        _timeLabel.font =font_px_Medium(fontSize(36.0,35.0,34.0));
        
        _timeLabel.numberOfLines = 1;
        
        _timeLabel.textAlignment = 1;
        
        _timeLabel.text = @"2016.02.60";
        
        _timeLabel.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
        [_timeLabel sizeToFit];
        _timeLabel.frame = CGRectMake(_timeLabel.frame.origin.x, _timeLabel.frame.origin.y, self.frame.size.width, _timeLabel.frame.size.height);
    }
    
    return _timeLabel;
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
