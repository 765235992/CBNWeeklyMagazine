//
//  CBNUserInfoTextAndArrorsCell.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNUserInfoTextAndArrorsCell.h"
@interface CBNUserInfoTextAndArrorsCell ()
@property (nonatomic, strong) UILabel *keyLabel;
@property (nonatomic, strong) UIImageView *arrowsImageView;
@property (nonatomic, strong) UIImageView *lineImageView;
@property (nonatomic, strong) UILabel *valueLabel;
@end
@implementation CBNUserInfoTextAndArrorsCell

- (void)dealloc
{
    CBNLog(@"释放 %@",self);
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
    // Configure the view for the selected state
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 44*screen_Width/320);

        [self addSubview:self.keyLabel];
        
        [self addSubview:self.arrowsImageView];
        
        [self addSubview:self.valueLabel];
        _arrowsImageView.center = CGPointMake(_arrowsImageView.center.x, self.frame.size.height/2);
        
        [self addSubview:self.lineImageView];
        
    }
    
    return self;
}

- (UILabel *)keyLabel
{
    if (!_keyLabel) {
        
        self.keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(12, 0, screen_Width*2/3, self.frame.size.height)];
        
        _keyLabel.font = font_px_Medium(14.0);
        
        _keyLabel.dk_textColorPicker = DKColorPickerWithKey(字体默认颜色);
    }
    
    return _keyLabel;
}

- (UILabel *)valueLabel
{
    if (!_valueLabel) {
        
        self.valueLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screen_Width- self.arrowsImageView.frame.size.width-20, self.frame.size.height)];
        
        _valueLabel.font = font_px_Medium(14.0);
        
        _valueLabel.textAlignment = NSTextAlignmentRight;
        
        _valueLabel.dk_textColorPicker = DKColorPickerWithKey(字体默认颜色);
        
    }
    
    return _valueLabel;
}
- (UIImageView *)arrowsImageView
{
    if (!_arrowsImageView) {
        
        self.arrowsImageView = [[UIImageView alloc] initWithFrame:CGRectMake(screen_Width-26, 0, 14, 23)];
        
        _arrowsImageView.dk_imagePicker = DKImagePickerWithImages([UIImage imageNamed:@"Setter_arrows_right_day@2x.png"],[UIImage imageNamed:@"Setter_arrows_right_day@2x.png"],[UIImage imageNamed:@"Setter_arrows_right_day@2x.png"]);
        _arrowsImageView.backgroundColor = [UIColor clearColor];
        
    }
    
    return _arrowsImageView;
}
- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        
        self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 49, screen_Width, 1)];
        
        _lineImageView.dk_backgroundColorPicker = DKColorPickerWithKey(分割线默认颜色);
    }
    
    return _lineImageView;
}
- (void)setUserInfoDic:(NSDictionary *)userInfoDic
{
    _keyLabel.text = userInfoDic[@"key"];
    
    _valueLabel.text = userInfoDic[@"value"];
}


@end
