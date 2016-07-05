//
//  CBNArticleHeaderView.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/28.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNArticleHeaderView.h"
#define clearance_Left_Right 20*screen_Width/320
#define clearance_Top_Bottom 5

@interface CBNArticleHeaderView ()
@property (nonatomic, strong) NSMutableArray *authorArray;

@end

@implementation CBNArticleHeaderView
- (void)dealloc
{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);
        [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(dayAndNightChange) name:@"dayAndNightChange" object:nil];

        [self addSubview:self.newsThumbImageView];
        
        [self addSubview:self.newsTitleLabel];
        
        [self addSubview:self.newsNotesLabel];
        
        [self addSubview:self.authorLabel];
        
        [self addSubview:self.timeLabel];
        
        [self addSubview:self.downArrowImageView];
        
        

    }
    return self;
}
- (CBNImageView *)newsThumbImageView
{
    if (!_newsThumbImageView) {
        
        self.newsThumbImageView = [[CBNImageView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Width*0.7)];
        
        _newsThumbImageView.image = [UIImage imageNamed:@"defaultImage.jpg"];
    }
    
    return _newsThumbImageView;
}
- (CBNLabel *)newsTitleLabel
{
    if (!_newsTitleLabel) {
        
        self.newsTitleLabel = [[CBNLabel alloc] initWithFrame:CGRectMake(10, _newsThumbImageView.frame.size.height + screen_Width*0.12, screen_Width-clearance_Left_Right*2, 0)];
        
        _newsTitleLabel.backgroundColor = [UIColor clearColor];
        
        _newsTitleLabel.lineSpace = 3;
        
        _newsTitleLabel.textAlignment = NSTextAlignmentCenter;
        
        _newsTitleLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
        
        _newsTitleLabel.font = font_px_Medium(fontSize(70.0,52.0,48.0));
        
    }
    
    return _newsTitleLabel;
}
- (CBNLabel *)newsNotesLabel
{
    if (!_newsNotesLabel) {
        
        self.newsNotesLabel = [[CBNLabel alloc] initWithFrame:CGRectMake(10, 0, screen_Width-clearance_Left_Right*2, 0)];
        
        _newsNotesLabel.lineSpace = 1.5;
        
        _newsNotesLabel.textAlignment = NSTextAlignmentCenter;
        
        _newsNotesLabel.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
        
        _newsNotesLabel.font = font_px_Regular(fontSize(42.0,36.0,36.0));
        
    }
    
    return _newsNotesLabel;
}


- (JHCTLabel *)authorLabel
{
    if (!_authorLabel) {
        
        self.authorLabel = [[JHCTLabel alloc] initWithFrame:CGRectMake(10, 100, screen_Width-clearance_Left_Right*2,100)];
        
        _authorLabel.backgroundColor = [UIColor clearColor];
        
        
    }
    
    return _authorLabel;
}

- (UILabel *)timeLabel
{
    if (!_timeLabel) {
        
        self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
        
        _timeLabel.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);
        
        _timeLabel.font = font_px_Medium(fontSize(36.0,32.0,32.0));
    }
    
    return _timeLabel;
}

- (UIImageView *)downArrowImageView
{
    if (!_downArrowImageView) {
        
        self.downArrowImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 15*screen_Width/320, 15*screen_Width/320)];
        
        _downArrowImageView.backgroundColor = [UIColor clearColor];
//
        _downArrowImageView.dk_imagePicker = DKImagePickerWithImages([UIImage imageNamed:@"article_Down_Arrow_image_Day.png"],[UIImage imageNamed:@"article_Down_Arrow_image_Night.png"],[UIImage imageNamed:@"article_Down_Arrow_image_Day.png"]);
    }
    
    return _downArrowImageView;
}

- (void)setChapt_Info_Model:(CBNChaptInfoModel *)chapt_Info_Model
{
    
    [_newsThumbImageView sd_setImageWithURL:[NSURL URLWithString:_chapt_Info_Model.chaptPicURL] placeholderImage:[UIImage imageNamed:@"defaultImage.jpg"]];
    
    
    _chapt_Info_Model = chapt_Info_Model;
    
    self.newsTitleLabel.content = chapt_Info_Model.chaptTitle;
    
    [_newsTitleLabel sizeToFit];
    
    _newsTitleLabel.frame = CGRectMake(0.132*screen_Width, _newsThumbImageView.frame.size.height + screen_Width*0.12, screen_Width - 0.132*screen_Width*2, _newsTitleLabel.frame.size.height);
    
    _newsNotesLabel.content = _chapt_Info_Model.chaptBrief;
    
    [_newsNotesLabel sizeToFit];
    
    _newsNotesLabel.frame = CGRectMake(0.132*screen_Width, _newsTitleLabel.frame.origin.y + _newsTitleLabel.frame.size.height + 0.055*screen_Width, screen_Width-0.132*screen_Width*2, _newsNotesLabel.frame.size.height);
    
}
- (NSMutableArray *)authorArray
{
    if (!_authorArray) {
        
        self.authorArray = [[NSMutableArray alloc] init];
    }
    return _authorArray;
}
- (void)setAuthor_List:(NSArray *)author_List
{
    _author_List = author_List;
    [self dayAndNightChange];
//    if (author_List.count > 0) {
//        
//        [self.authorArray addObject:[self canClickedDicWithText:@"作者 | " andTextColor:0x515151 isCanClicked:JHCoreTextModleButtonType]];
//
//        
//        for (int i = 0; i < author_List.count; i++) {
//            if (i%2 ==1) {
//                
//                [self.authorArray addObject:[self noClickedDicWithText:@" | "]];
//            }
//            
//            CBNChaptAuthorModel *authorModel = [author_List objectAtIndex:i];
//            
//            [self.authorArray addObject:[self canClickedDicWithText:authorModel.authorName andTextColor:0x515151 isCanClicked:JHCoreTextModleButtonType]];
//            
//        }
//        
//    }else{
//        
//        [self.authorArray addObject:[self canClickedDicWithText:@"第一财经周刊" andTextColor:0x515151 isCanClicked:JHCoreTextModleButtonType]];
//        
//    }
    
    CGFloat notesHeight = _newsNotesLabel.frame.size.height + _newsNotesLabel.frame.origin.y + screen_Width*0.05;
    
    _authorLabel.sourceArray = self.authorArray;
    
    _authorLabel.frame = CGRectMake(clearance_Left_Right, notesHeight , _authorLabel.frame.size.width, _authorLabel.frame.size.height);
    
    _authorLabel.backgroundColor = [UIColor clearColor];
    
    _authorLabel.center = CGPointMake(screen_Width/2, _authorLabel.center.y);
    
    _timeLabel.text = [NSDate getUTCFormateDate:@"2015-15-02 08:08"];
    _timeLabel.text = @"10天前";
    [_timeLabel sizeToFit];
    notesHeight = notesHeight + _authorLabel.frame.size.height + screen_Width*0.005;
    
    _timeLabel.frame = CGRectMake(0, notesHeight , _timeLabel.frame.size.width, _timeLabel.frame.size.height);

    _timeLabel.center = CGPointMake(screen_Width/2, _timeLabel.center.y);
    
    
    _downArrowImageView.frame = CGRectMake(0, _timeLabel.frame.origin.y + _timeLabel.frame.size.height +0.12*screen_Width, _downArrowImageView.frame.size.width, _downArrowImageView.frame.size.height);
    
    _downArrowImageView.center = CGPointMake(screen_Width/2, _downArrowImageView.center.y);
    
    self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, _downArrowImageView.frame.origin.y + _downArrowImageView.frame.size.height);
    
    
}
- (void)dayAndNightChange
{
    [self.authorArray removeAllObjects];

    if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNight]) {
        
//        [self.dk_manager dawnComing];
        if (_author_List.count > 0) {
            
            [self.authorArray addObject:[self canClickedDicWithText:@"作者 | " andTextColor:0xF0FFFF isCanClicked:JHCoreTextModleButtonType]];
            
            
            for (int i = 0; i < _author_List.count; i++) {
                if (i%2 ==1) {
                    
                    [self.authorArray addObject:[self canClickedDicWithText:@" | " andTextColor:0xF0FFFF isCanClicked:JHCoreTextModleTextType]];
                }
                
                CBNChaptAuthorModel *authorModel = [_author_List objectAtIndex:i];
                
                [self.authorArray addObject:[self canClickedDicWithText:authorModel.authorName andTextColor:0xF0FFFF isCanClicked:JHCoreTextModleButtonType]];
                
            }
            
        }else{
            
            [self.authorArray addObject:[self canClickedDicWithText:@"第一财经周刊" andTextColor:0xF0FFFF isCanClicked:JHCoreTextModleButtonType]];
            
        }

        
    } else {
        if (_author_List.count > 0) {
            
            [self.authorArray addObject:[self canClickedDicWithText:@"作者 | " andTextColor:0x515151 isCanClicked:JHCoreTextModleButtonType]];
            
            
            for (int i = 0; i < _author_List.count; i++) {
                if (i%2 ==1) {
                    
                    [self.authorArray addObject:[self canClickedDicWithText:@" | " andTextColor:0x515151 isCanClicked:JHCoreTextModleTextType]];
                }
                
                CBNChaptAuthorModel *authorModel = [_author_List objectAtIndex:i];
                
                [self.authorArray addObject:[self canClickedDicWithText:authorModel.authorName andTextColor:0x515151 isCanClicked:JHCoreTextModleButtonType]];
                
            }
            
        }else{
            
            [self.authorArray addObject:[self canClickedDicWithText:@"第一财经周刊" andTextColor:0x515151 isCanClicked:JHCoreTextModleButtonType]];
            
        }

        
    }
    CGFloat notesHeight = _newsNotesLabel.frame.size.height + _newsNotesLabel.frame.origin.y + screen_Width*0.05;

    _authorLabel.sourceArray = self.authorArray;

    _authorLabel.frame = CGRectMake(clearance_Left_Right, notesHeight , _authorLabel.frame.size.width, _authorLabel.frame.size.height);
//
    _authorLabel.backgroundColor = [UIColor clearColor];
    _authorLabel.center = CGPointMake(screen_Width/2, _authorLabel.center.y);


}
- (NSDictionary *)canClickedDicWithText:(NSString *)text andTextColor:(int)color isCanClicked:(JHCoreTextModleType)isCanClicked;
{
    
    CGFloat width = screen_Width-clearance_Left_Right*2;
    ;
    NSNumber *authorSize  = [NSNumber numberWithInt:fontSize(36.0,36.0,36.0)];
    
    NSNumber *authorColor = [NSNumber numberWithInt:color];
    
    NSNumber *canClicked = [NSNumber numberWithInt:isCanClicked];
    
    NSDictionary *tempAuthotDic = [[NSMutableDictionary alloc] init];
    [tempAuthotDic setValue:[NSNumber numberWithInteger:1] forKey:@"textAlignment"];
    
    [tempAuthotDic setValue:[NSString stringWithFormat:@"%f",width]  forKey:@"width"];
    
    [tempAuthotDic setValue:authorSize forKey:@"fontSize"];
    
    [tempAuthotDic setValue:authorColor forKey:@"textColor"];
    
    [tempAuthotDic setValue:canClicked forKey:@"modleType"];
    
    [tempAuthotDic setValue:text forKey:@"text"];
    
    return tempAuthotDic;
}
@end
