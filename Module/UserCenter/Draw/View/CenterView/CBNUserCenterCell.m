//
//  CBNUserCenterCell.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/28.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNUserCenterCell.h"
#define user_Center_clearance 24*320/screen_Width

@interface CBNUserCenterCell ()
@property (nonatomic, strong) UILabel *titleLabel;
@end

@implementation CBNUserCenterCell

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
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        self.backgroundColor = [UIColor clearColor];
        
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, 2*user_Center_clearance + _titleLabel.frame.size.height);
        
        [self addSubview:self.titleLabel];
    }
    return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(user_Center_clearance, 15*320/screen_Width, self.frame.size.width, 45 *screen_Width/320)];
        
        _titleLabel.font = font_px_Regular(fontSize(46,32,36));
        
        _titleLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
        
        _titleLabel.text = @"离线杂志";
        
        [_titleLabel sizeToFit];
    }
    
    return _titleLabel;
}

- (void)setText:(NSString *)text
{
    _titleLabel.text = text;
    
    [_titleLabel sizeToFit];

}






@end
