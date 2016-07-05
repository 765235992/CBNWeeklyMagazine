//
//  CBNRelatedNewsCell.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/29.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNRelatedNewsCell.h"
#import "CBNRelatedNewsView.h"


@interface CBNRelatedNewsCell ()
@property (nonatomic, strong) CBNRelatedNewsView *relatedNewsView;
@end

@implementation CBNRelatedNewsCell


- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;
        self.dk_backgroundColorPicker =  DKColorPickerWithKey(默认背景颜色);

        [self addSubview:self.relatedNewsView];
        
        
    }
    
    return self;
}


- (CBNRelatedNewsView *)relatedNewsView
{
    if (!_relatedNewsView) {
        
        self.relatedNewsView = [[CBNRelatedNewsView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, screen_Width * 0.37*0.555 + 50)];
        
    }
    
    return _relatedNewsView;
}










@end
