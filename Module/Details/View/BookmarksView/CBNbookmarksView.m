//
//  CBNbookmarksView.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/29.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNbookmarksView.h"

@interface CBNbookmarksView ()

@property (nonatomic, strong) UILabel *bookMarksLabel;


@property (nonatomic, strong) UIView *backgroundView;
@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;


@end

@implementation CBNbookmarksView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        [self addSubview:self.bookMarksLabel];
        [self addSubview:self.leftImageView];
        [self addSubview:self.rightImageView];
        _leftImageView.center = CGPointMake(_leftImageView.center.x, _bookMarksLabel.center.y);
        _rightImageView.center = CGPointMake(_rightImageView.center.x, _bookMarksLabel.center.y);

        [self addSubview:self.backgroundView];
        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _backgroundView.frame.size.height+_backgroundView.frame.origin.y);
    }
    return self;
}
- (UILabel *)bookMarksLabel
{
    if (!_bookMarksLabel) {
        
        self.bookMarksLabel = [[UILabel alloc] init];
        _bookMarksLabel.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
        _bookMarksLabel.backgroundColor = [UIColor clearColor];
        _bookMarksLabel.font = font_px_Medium(fontSize(36.0,32.0,28.0));
        
        _bookMarksLabel.text = @"相关书签";
        
        [_bookMarksLabel sizeToFit];
        
        _bookMarksLabel.frame = CGRectMake(0, 0, _bookMarksLabel.frame.size.width+15*screen_Width/320, _bookMarksLabel.frame.size.height);
        
        _bookMarksLabel.textAlignment = 1;
        
   

        _bookMarksLabel.text = @"相关书签";
        
        
        _bookMarksLabel.center = CGPointMake(screen_Width/2, _bookMarksLabel.center.y);
        
    }
    
    return _bookMarksLabel;
}

- (UIImageView *)leftImageView
{
    if (!_leftImageView) {
        
        self.leftImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, (screen_Width - self.bookMarksLabel.frame.size.width)/2, 1)];
        
        _leftImageView.dk_backgroundColorPicker = DKColorPickerWithKey(文章详情推荐标签背景颜色);

    }
    
    return _leftImageView;
}

- (UIImageView *)rightImageView
{
    if (!_rightImageView) {
        
        self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake((screen_Width - self.bookMarksLabel.frame.size.width)/2 + _bookMarksLabel.frame.size.width, 0, (screen_Width - self.bookMarksLabel.frame.size.height)/2, 1)];
        
        _rightImageView.dk_backgroundColorPicker = DKColorPickerWithKey(文章详情推荐标签背景颜色);
        
    }
    
    return _rightImageView;
}
- (UIView *)backgroundView
{
    if (!_backgroundView) {
        
        self.backgroundView = [[UIView alloc] initWithFrame:CGRectMake(0, _bookMarksLabel.frame.size.height + screen_Width*0.015, screen_Width, 50)];

        _backgroundView.dk_backgroundColorPicker = DKColorPickerWithKey(文章详情推荐标签背景颜色);
        NSMutableArray *labelArr = [[NSMutableArray alloc] init];
        
        CGFloat width = 0.0;
        CGFloat height = 0.0;

        NSArray *titleArr = @[@"封面故事",@"联想",@"苹果"];
        for (int i = 0; i < titleArr.count; i++) {
            UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
            label.font = font_px_Medium(fontSize(36.0,36.0,28.0));
            label.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
            label.textAlignment = 1;
            label.text = [titleArr objectAtIndex:i];
            [label sizeToFit];
            label.textAlignment = 1;
            label.text = [titleArr objectAtIndex:i];
            label.frame = CGRectMake(0, 7.5*screen_Width/320, label.frame.size.width + (label.frame.size.height+4*3*screen_Width/320), label.frame.size.height+4*screen_Width/320);
            width = width+label.frame.size.width ;
            if (width < screen_Width-20) {
                
                label.layer.borderColor = [UIColor redColor].CGColor;
                
                label.layer.cornerRadius = label.frame.size.height/2;
                label.layer.dk_borderColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);

                
                label.layer.borderWidth = 1;
                
                [labelArr addObject:label];
            }else{
                width = width-label.frame.size.width;
                
            }
            height = label.frame.size.height + 15 * screen_Width/320;

            
            
        
            
        }
        _backgroundView.frame = CGRectMake(_backgroundView.frame.origin.x, _backgroundView.frame.origin.y, _backgroundView.frame.size.width, height);

        CGFloat begin = (screen_Width - width - (labelArr.count-1)*10)/2;
        for (UILabel *label in labelArr) {
            
            label.frame = CGRectMake(begin, 7.5*screen_Width/320, label.frame.size.width, label.frame.size.height);
            
            label.center = CGPointMake(label.center.x, _backgroundView.frame.size.height/2);
            [_backgroundView addSubview:label];
            
            begin = begin + label.frame.size.width+screen_Width * 0.02;
            
        }
//        _backgroundView.frame = CGRectMake(_backgroundView.frame.origin.x, _backgroundView.frame.origin.y, _backgroundView.frame.size.width, height);

        
    }
    
    return _backgroundView;
}









@end
