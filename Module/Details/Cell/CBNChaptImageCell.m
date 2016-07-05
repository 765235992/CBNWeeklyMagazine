//
//  CBNChaptImageCell.m
//  CBNMagazine
//
//  Created by huaxianwei on 16/6/19.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNChaptImageCell.h"



@interface CBNChaptImageCell ()
@property (nonatomic, strong) CBNImageView *newsImageView;
@property (nonatomic, strong) CBNLabel *imageTitleLabel;
@end

@implementation CBNChaptImageCell

- (void)dealloc
{
    NSLog(@"释放%@",self);
}
- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [self addSubview:self.newsImageView];
        [self addSubview:self.imageTitleLabel];
        self.backgroundColor = [UIColor clearColor];
        
    }
    
    return self;
}
- (CBNImageView *)newsImageView
{
    if (!_newsImageView) {
        
        self.newsImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(0, screen_Width*0.112, screen_Width, 250)];
        //        _newsImageView.contentMode =  UIViewContentModeScaleAspectFit;
        _newsImageView.backgroundColor = [UIColor clearColor];

    }
    
    return _newsImageView;
}
- (CBNLabel *)imageTitleLabel
{
    if (!_imageTitleLabel) {
        
        self.imageTitleLabel = [[CBNLabel alloc] initWithFrame:CGRectMake(screen_Width*0.05, _newsImageView.frame.size.height + _newsImageView.frame.origin.y + 0.03*screen_Width, screen_Width- screen_Width*0.05*2, 0)];
        _imageTitleLabel.backgroundColor = [UIColor clearColor];
        _imageTitleLabel.textAlignment = 1;
        _imageTitleLabel.font = font_px_Regular(fontSize(36.0,42.0,32.0));
        _imageTitleLabel.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);

    }
    
    return _imageTitleLabel;
}
- (void)setChaptBlockModel:(CBNChaptBlockModel *)chaptBlockModel
{
    _chaptBlockModel = chaptBlockModel;
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        
        [_newsImageView sd_setImageWithURL:[NSURL URLWithString:chaptBlockModel.blockImageContent.imageURL] placeholderImage:nil];
        
        
        dispatch_async(dispatch_get_main_queue(), ^{
            
            
            
        });
        
    });
    CGFloat width = chaptBlockModel.blockImageContent.imageWidth;
    
    CGFloat height = chaptBlockModel.blockImageContent.imageHeight;
    
    if (width > screen_Width) {
        width = screen_Width;
        height = (screen_Width)*height/chaptBlockModel.blockImageContent.imageWidth;
    }
    
    _newsImageView.frame = CGRectMake(0, _newsImageView.frame.origin.y, width, height);
    
    _newsImageView.center = CGPointMake(screen_Width/2, _newsImageView.center.y);
    
    _newsImageView.nightMaskImageView.frame = _newsImageView.bounds;
    
    
    if (chaptBlockModel.blockImageContent.imageTitle != NULL) {
        
        _imageTitleLabel.content = chaptBlockModel.blockImageContent.imageTitle;
        
        [_imageTitleLabel sizeToFit];
        
        _imageTitleLabel.frame = CGRectMake(screen_Width*0.08, _newsImageView.frame.size.height + _newsImageView.frame.origin.y + 0.03*screen_Width, screen_Width- screen_Width*0.08*2, _imageTitleLabel.frame.size.height);
        
        height = height + _imageTitleLabel.frame.size.height +screen_Width*0.07 +  screen_Width*0.112;
    }else{
        height = height + 2 * screen_Width*0.112;

    }
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, width, height);
    
    _chaptBlockModel.height = height ;
    
    [self setNeedsDisplay];
    
    [self setNeedsLayout];
}

@end
