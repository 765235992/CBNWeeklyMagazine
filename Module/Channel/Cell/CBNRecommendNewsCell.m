//
//  CBNRecommendNewsCell.m
//  CBNMagazine
//
//  Created by Jim on 16/6/17.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNRecommendNewsCell.h"
#import "CBNImageAndTextLabel.h"

#define imageView_Height 0.54*(320-20)*screen_Width/320
#define clearnWidth 5*screen_Width/320

@interface CBNRecommendNewsCell ()
@property (nonatomic, strong) CBNImageView *newsThumbImageView;

@property (nonatomic, strong) CBNLabel *newsTitleLabel;

@property (nonatomic, strong) UILabel *timelabel;

@property (nonatomic, strong) UIImageView *lineImageView;

@property (nonatomic, strong) CBNImageAndTextLabel *praiseLabel;

@property (nonatomic, strong) CBNImageAndTextLabel *commentsCountLabel;
@property (nonatomic, strong) UILabel *categoryLabel;

@property (nonatomic, strong) UIImageView *buyIconImageView;

@property (nonatomic, strong) UIImageView *audioIconImageView;

@end
@implementation CBNRecommendNewsCell
- (void)dealloc
{
    CBNLog(@"正常新闻cell释放了");
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);

        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubview:self.newsThumbImageView];
        [_newsThumbImageView addSubview:self.timelabel];

        [self addSubview:self.newsTitleLabel];
        
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _newsTitleLabel.frame.origin.y + _newsTitleLabel.frame.size.height+10);
        [self addSubview:self.lineImageView];
    }
    
    return self;
}

- (CBNImageView *)newsThumbImageView
{
    if (!_newsThumbImageView) {
        
        self.newsThumbImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(10, 15, screen_Width-20, imageView_Height)];

        _newsThumbImageView.nightMaskImageView.dk_backgroundColorPicker= DKColorPickerWithColors(RGBColor(0, 0, 0, 0.26),RGBColor(0, 0, 0, 0.5),RGBColor(0, 0, 0, 0.26));
        _newsThumbImageView.image = [UIImage imageNamed:@"defaultImage.jpg"];
        
        [_newsThumbImageView addSubview:self.praiseLabel];
        
        [_newsThumbImageView addSubview:self.commentsCountLabel];
        
        [_newsThumbImageView addSubview:self.categoryLabel];

        [_newsThumbImageView addSubview:self.buyIconImageView];
        
        [_newsThumbImageView addSubview:self.audioIconImageView];

    }
    
    return _newsThumbImageView;
}
- (UILabel *)categoryLabel
{
    if (!_categoryLabel) {
        
        self.categoryLabel = [[UILabel alloc] init];
        _categoryLabel.font = font_px_Medium(fontSize(30.0,31.0,24.0));
        
    }
    
    return _categoryLabel;
}

- (UIImageView *)buyIconImageView
{
    if (!_buyIconImageView) {
        
        self.buyIconImageView = [[UIImageView alloc] initWithImage:[RGBColor(3, 3, 3, 1) colorImage]];
        
        
    }
    
    return _buyIconImageView;
}
- (UIImageView *)audioIconImageView
{
    if (!_audioIconImageView) {
        
        self.audioIconImageView = [[UIImageView alloc] initWithImage:[RGBColor(3, 3, 3, 1) colorImage]];
        
    }
    
    return _audioIconImageView;
}

- (CBNLabel *)newsTitleLabel
{
    if (!_newsTitleLabel) {
        
        self.newsTitleLabel = [[CBNLabel alloc] initWithFrame:CGRectMake( 10, imageView_Height + 30, screen_Width - 20, 0)];
        _newsTitleLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
        
        _newsTitleLabel.font = font_px_Medium(fontSize(48.0,40.0,36.0));
        
        _newsTitleLabel.lineSpace = 2.0;
        
        _newsTitleLabel.numberOfLines = 0;

        
        }
    
    return _newsTitleLabel;
}
- (CBNImageAndTextLabel *)praiseLabel
{
    if (!_praiseLabel) {
        
        self.praiseLabel = [[CBNImageAndTextLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) image:[RGBColor(102, 198, 118, 1.0) colorImage]];
        _praiseLabel.contentLabel.dk_textColorPicker = DKColorPickerWithKey(图片上的默认标签字体颜色);
        
          _praiseLabel.iconImageView.dk_imagePicker = DKImagePickerWithImages([UIImage imageNamed:@"praiseCount_white_Day.png"],[UIImage imageNamed:@"praiseCount_white_Day.png"],[UIImage imageNamed:@"praiseCount_white_Day.png"]);
    }
    
    return _praiseLabel;
}

- (CBNImageAndTextLabel *)commentsCountLabel
{
    if (!_commentsCountLabel) {
        
        self.commentsCountLabel = [[CBNImageAndTextLabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0) image:[RGBColor(102, 198, 118, 1.0) colorImage]];
        
        _commentsCountLabel.contentLabel.dk_textColorPicker = DKColorPickerWithKey(图片上的默认标签字体颜色);
        
        _commentsCountLabel.iconImageView.dk_imagePicker = DKImagePickerWithImages([UIImage imageNamed:@"commentsCount_white_Day.png"],[UIImage imageNamed:@"commentsCount_white_Day.png"],[UIImage imageNamed:@"commentsCount_white_Day.png"]);

    }
    
    return _commentsCountLabel;
}
- (UILabel *)timelabel
{
    if (!_timelabel) {
        
        self.timelabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        
        _timelabel.dk_textColorPicker = DKColorPickerWithKey(图片上的默认标签字体颜色);
        
        _timelabel.font = font_px_Medium(fontSize(30.0,31.0,24.0));
        
        _timelabel.numberOfLines = 0;
    }
    
    return _timelabel;
}
- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        
        self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, self.frame.size.height -1, screen_Width, 1)];
        
        _lineImageView.dk_backgroundColorPicker = DKColorPickerWithKey(新闻列表分割线颜色);
    }
    
    return _lineImageView;
}
- (void)setNewsItemModel:(CBNNewsItemModel *)newsItemModel
{
    [_newsThumbImageView sd_setImageWithURL:[NSURL URLWithString:newsItemModel.cover_img_big] placeholderImage:[UIImage imageNamed:@"defaultImage.jpg"]];
    
    
    _categoryLabel.frame = CGRectMake(0,0,0,0);
    
//    if (newsItemModel.columnInfo.count > 0 ) {
        CBNChannelColumnModel *columnModel = [newsItemModel.columnInfo firstObject];
        
        _categoryLabel.text = columnModel.name;
        _categoryLabel.text = @"今日头条";

        [_categoryLabel sizeToFit];
        
        _categoryLabel.frame = CGRectMake(clearnWidth,clearnWidth, _categoryLabel.frame.size.width+_categoryLabel.frame.size.height*1.2, _categoryLabel.frame.size.height);
        _categoryLabel.textAlignment = 1;
        _categoryLabel.layer.borderColor = [UIColor whiteColor].CGColor;
        _categoryLabel.layer.borderWidth = 1;
        _categoryLabel.textColor = [UIColor colorWithHexString:columnModel.color];
        _categoryLabel.textColor = [UIColor whiteColor];

        _categoryLabel.layer.cornerRadius = _categoryLabel.frame.size.height/2;
        
//    }
    CGFloat iconImageWidth = 12*screen_Width/320;
    
    CGFloat Width = 12*screen_Width/320;

    BOOL isHavePermissions = [CBNpPermissionsManager isHaveReadPermissionsWithIssueID:[newsItemModel.issue_id integerValue]];
    
    _buyIconImageView.frame = CGRectMake(0, 0, 0, 0);
    
    _audioIconImageView.frame = CGRectMake(0, 0, 0, 0);
    
    if (isHavePermissions == YES) {
        
        _buyIconImageView.frame = CGRectMake(_newsThumbImageView.frame.size.width-3-iconImageWidth, 3,iconImageWidth, iconImageWidth);
        
        Width = iconImageWidth*2+3;
        
    }
    if ([newsItemModel.DataType integerValue] == 3) {
        
        _audioIconImageView.frame = CGRectMake(_newsThumbImageView.frame.size.width-3-Width, 3,iconImageWidth, iconImageWidth);
        
    }

    
    _timelabel.frame = CGRectMake(0, 0, 0, 0);
    
    _timelabel.text = [NSDate getUTCFormateDate:newsItemModel.renewtime];
    
    [_timelabel sizeToFit];
    
    _timelabel.frame = CGRectMake(clearnWidth, imageView_Height - clearnWidth - _timelabel.frame.size.height, _timelabel.frame.size.width, _timelabel.frame.size.height);
    _commentsCountLabel.frame = CGRectMake(0, 0, 0, 0);
    
    _commentsCountLabel.text = [NSString stringWithFormat:@"%ld",[newsItemModel.Comments integerValue]];
    
    CGFloat commentsWidth = _commentsCountLabel.frame.size.width + 7;
    
    _commentsCountLabel.frame = CGRectMake(_newsThumbImageView.frame.size.width - commentsWidth, imageView_Height - clearnWidth - _commentsCountLabel.frame.size.height, _commentsCountLabel.frame.size.width, _commentsCountLabel.frame.size.height);
    _praiseLabel.frame = CGRectMake(0, 0, 0, 0);
    
    _praiseLabel.text =  [NSString stringWithFormat:@"%ld",[newsItemModel.Like integerValue]];;
    
    CGFloat praiseWidth = _praiseLabel.frame.size.width + 18;
    
    _praiseLabel.frame = CGRectMake(_newsThumbImageView.frame.size.width - commentsWidth - praiseWidth, imageView_Height - clearnWidth - _praiseLabel.frame.size.height, praiseWidth, _praiseLabel.frame.size.height);
    
    _newsTitleLabel.content = newsItemModel.chapt_title;
    
    [_newsTitleLabel sizeToFit];
    
    _newsTitleLabel.frame = CGRectMake(_newsTitleLabel.frame.origin.x, _newsTitleLabel.frame.origin.y, screen_Width  - 20, _newsTitleLabel.frame.size.height);
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _newsTitleLabel.frame.origin.y + _newsTitleLabel.frame.size.height+16);
    
    _lineImageView.frame = CGRectMake(10, self.frame.size.height -1, screen_Width -20, 1);
    
    _newsItemModel = newsItemModel;
    
    _newsItemModel.height = self.frame.size.height;
    [self setNeedsDisplay];
    
    [self setNeedsLayout];
    
    [_timelabel setNeedsLayout];
    [_timelabel setNeedsDisplay];
}




@end
