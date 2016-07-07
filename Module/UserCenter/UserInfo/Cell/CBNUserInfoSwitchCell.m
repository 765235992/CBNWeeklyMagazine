//
//  CBNUserInfoSwitchCell.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNUserInfoSwitchCell.h"

@interface CBNUserInfoSwitchCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *keyLabel;

@end

@implementation CBNUserInfoSwitchCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 44*screen_Width/320);
        [self addSubview:self.iconImageView];
        [self addSubview:self.keyLabel];
        [self addSubview:self.valueSwitch];
        _valueSwitch.center = CGPointMake(_valueSwitch.center.x, self.frame.size.height/2);

    }
    
    return self;
}

- (UIImageView *)iconImageView
{
    if (!_iconImageView) {
        
        self.iconImageView = [[UIImageView alloc] initWithFrame:CGRectMake(12, 7*screen_Width/320, (self.frame.size.height - 14*screen_Width/320), (self.frame.size.height - 14*screen_Width/320))];
        
        _iconImageView.backgroundColor = [UIColor redColor];
        
        
        _iconImageView.layer.cornerRadius = _iconImageView.frame.size.height/2;
        
        _iconImageView.layer.masksToBounds = YES;
    }
    
    return _iconImageView;
}

- (UILabel *)keyLabel
{
    if (!_keyLabel) {
        
        self.keyLabel = [[UILabel alloc] initWithFrame:CGRectMake(_iconImageView.frame.size.width+_iconImageView.frame.origin.x+12,0, self.frame.size.width, self.frame.size.height)];
        
        _keyLabel.font = font_px_Medium(14.0);
        
        _keyLabel.dk_textColorPicker = DKColorPickerWithKey(字体默认颜色);
    }
    
    return _keyLabel;
}
- (UISwitch *)valueSwitch
{
    if (!_valueSwitch) {
        
        self.valueSwitch = [[UISwitch alloc] initWithFrame:CGRectMake(screen_Width-42, 0, 30, 20)];
        _valueSwitch.backgroundColor = [UIColor clearColor];
        
        _valueSwitch.frame = CGRectMake(screen_Width - 12 - _valueSwitch.frame.size.width, 0, _valueSwitch.frame.size.width, _valueSwitch.frame.size.height);
        if (_valueSwitch.on == YES) {
            _valueSwitch.thumbTintColor = UIColorFromRGB(0xFA6C6E);

        }else{
            
            _valueSwitch.thumbTintColor = UIColorFromRGB(0xBEBEBE);
            
        }
        _valueSwitch.tintColor = [UIColor clearColor];
        _valueSwitch.onTintColor = [UIColor clearColor];
        _valueSwitch.layer.borderWidth = 1;
        _valueSwitch.layer.cornerRadius = _valueSwitch.frame.size.height/2;
        _valueSwitch.layer.borderColor = UIColorFromRGB(0xBEBEBE).CGColor;
        [_valueSwitch addTarget:self action:@selector(switchChanged:) forControlEvents:UIControlEventValueChanged];
    }
    
    return _valueSwitch;
}
- (void)switchChanged:(UISwitch *)sender
{
    if (sender.on == YES) {
        _valueSwitch.thumbTintColor = UIColorFromRGB(0xFA6C6E);
        
    }else{
        
        _valueSwitch.thumbTintColor = UIColorFromRGB(0xBEBEBE);
        
    }
    sender.on = !sender.on;
}
- (void)setUserInfoDic:(NSDictionary *)userInfoDic
{
    _keyLabel.text = userInfoDic[@"key"];

}
@end
