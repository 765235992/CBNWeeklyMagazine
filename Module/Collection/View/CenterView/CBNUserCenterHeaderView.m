//
//  CBNUserCenterHeaderView.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/28.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNUserCenterHeaderView.h"
#define user_Center_clearance 18*320/screen_Width
@interface CBNUserCenterHeaderView ()

@property (nonatomic, strong) UIButton *searchButton;

@property (nonatomic, strong) UIImageView *magnifyingGlassImageView;
@property (nonatomic, strong) UILabel *searchLabel;

@property (nonatomic, strong) UIImageView *photoImageView;

@property (nonatomic, strong) UILabel *nameLabel;

@property (nonatomic, strong) UIImageView *editorImageView;

@property (nonatomic, strong) UIImageView *lineImageView;
@end

@implementation CBNUserCenterHeaderView


- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        [self addSubview:self.searchButton];
        
        [self addSubview:self.photoImageView];
        
        [self addSubview:self.nameLabel];
        [self addSubview:self.editorImageView];
        [self addSubview:self.lineImageView];
        
        self.frame = CGRectMake(0, 0, user_Draw_open_With, _lineImageView.frame.origin.y + _lineImageView.frame.size.height+15*320/screen_Width );
    }
    
    return self;
}

- (UIButton *)searchButton
{
    if (!_searchButton) {
        
        self.searchButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _searchButton.frame = CGRectMake(user_Center_clearance, 50, user_Draw_open_With-2*user_Center_clearance, 25*screen_Width/320);
        
        _searchButton.layer.cornerRadius = _searchButton.frame.size.height/2;
        
        _searchButton.dk_backgroundColorPicker = DKColorPickerWithKey(搜索框背景颜色);
        
        
        [_searchButton addSubview:self.searchLabel];
        
        [_searchButton addSubview:self.magnifyingGlassImageView];

        _searchLabel.center = CGPointMake(_searchLabel.center.x, _searchButton.frame.size.height/2);
        
    }
    
    return _searchButton;
}

- (UIImageView *)magnifyingGlassImageView
{
    if (!_magnifyingGlassImageView) {
        
        CGFloat clearler = (_searchButton.frame.size.height - _searchLabel.frame.size.height + 5)/2;
        self.magnifyingGlassImageView = [[UIImageView alloc] initWithFrame:CGRectMake(clearler, clearler, _searchButton.frame.size.height-clearler*2, _searchButton.frame.size.height-clearler*2)];
        
        _magnifyingGlassImageView.backgroundColor = [UIColor redColor];
        
    }
    return _magnifyingGlassImageView;
}

- (UILabel *)searchLabel
{
    if (!_searchLabel) {
        
        self.searchLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        
        _searchLabel.font = font_px_Medium(fontSize(36,32,36));
        
        _searchLabel.text = @"搜索";
        _searchLabel.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
        
        [_searchLabel sizeToFit];
        
        _searchLabel.frame = CGRectMake(_searchButton.frame.size.height, 0, _searchLabel.frame.size.width, _searchLabel.frame.size.height);
        
        
        

    }
    
    return _searchLabel;
}
- (UIImageView *)photoImageView
{
    if (!_photoImageView) {
    
        self.photoImageView = [[UIImageView alloc] initWithFrame:CGRectMake(user_Center_clearance, _searchButton.frame.size.height + _searchButton.frame.origin.y + 15*screen_Width/320, 50*screen_Width/320, 50*screen_Width/320)];
        
        _photoImageView.layer.cornerRadius = _photoImageView.frame.size.height/2;
        
        _photoImageView.backgroundColor = [UIColor redColor];
        
    }
    
    
    return _photoImageView;
}

- (UILabel *)nameLabel
{
    if (!_nameLabel) {
        
        self.nameLabel = [[UILabel alloc] initWithFrame:CGRectMake(user_Center_clearance, _photoImageView.frame.size.height + _photoImageView.frame.origin.y + 12*screen_Width/320, user_Draw_open_With-2*user_Center_clearance - [NSString heightForStringFontSize:fontSize(36,32,36)]-5, 0)];
        
        _nameLabel.font = font_px_Medium(fontSize(36,32,36));
        
        _nameLabel.text = @"西门飘.西门飘西门飘西门飘西门飘";
        
        _nameLabel.numberOfLines = 2;
        
        [_nameLabel sizeToFit];
        
        _nameLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
        _nameLabel.frame = CGRectMake(user_Center_clearance, _nameLabel.frame.origin.y, _nameLabel.frame.size.width, _nameLabel.frame.size.height);

    }
    
    return _nameLabel;
}
- (UIImageView *)editorImageView
{
    if (!_editorImageView) {
        
        self.editorImageView = [[UIImageView alloc] initWithFrame:CGRectMake(_nameLabel.frame.size.width + _nameLabel.frame.origin.x+5, _nameLabel.frame.origin.y+2, [NSString heightForStringFontSize:fontSize(36,32,33)], [NSString heightForStringFontSize:fontSize(36,32,33)])];
        
        _editorImageView.backgroundColor = [UIColor redColor];
    }
    
    return _editorImageView;
}
- (UIImageView *)lineImageView
{
    if (!_lineImageView) {
        
        self.lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(user_Center_clearance, _nameLabel.frame.origin.y + _nameLabel.frame.size.height +  12*screen_Width/320, user_Draw_open_With-2*user_Center_clearance - [NSString heightForStringFontSize:fontSize(36,32,36)]-5, 1)];

        _lineImageView.dk_backgroundColorPicker = DKColorPickerWithKey(默认分割线颜色);
    }
    
    return _lineImageView;
}









@end
