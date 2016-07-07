//
//  CBNUserInfoPhotoCell.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNUserInfoPhotoCell.h"

@interface CBNUserInfoPhotoCell ()
@property (nonatomic, strong) CBNImageView *photoImageView;

@property (nonatomic, strong) UIImageView *arrowsImageView;

@property (nonatomic, strong) UIImageView *lineImageView;

@end

@implementation CBNUserInfoPhotoCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        [self addSubview:self.photoImageView];
        
        
        [self addSubview:self.arrowsImageView];
        
        
        [self addSubview:self.lineImageView];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 14*screen_Width/320 + 50*screen_Width/320);
        _arrowsImageView.center = CGPointMake(_arrowsImageView.center.x, self.frame.size.height/2);
        _lineImageView.frame = CGRectMake(0, self.frame.size.height-1, screen_Width, 1);

    }
    
    return self;
}

- (CBNImageView *)photoImageView
{
    if (!_photoImageView) {
        
        self.photoImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(12, 7*screen_Width/320, 50*screen_Width/320, 50*screen_Width/320)];
        
        _photoImageView.image = [UIImage imageNamed:@"defaultImage.jpg"];
        
        _photoImageView.layer.cornerRadius = _photoImageView.frame.size.height/2;
        
        _photoImageView.layer.masksToBounds = YES;

    }
    
    return _photoImageView;
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
    
}








@end
