//
//  CBNADBannerCell.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/29.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNADBannerCell.h"

@implementation CBNADBannerCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.dk_backgroundColorPicker =  DKColorPickerWithKey(默认背景颜色);

        [self addSubview:self.adBannerView];
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, screen_Width*0.348);
    }
    
    return self;
}

- (CBNImageView *)adBannerView
{
    if (!_adBannerView) {
        
        self.adBannerView = [[CBNImageView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Width*0.285)];
        
        _adBannerView.image = [UIImage imageNamed:@"defaultImage.jpg"];
        
    }
    
    return _adBannerView;
}
@end
