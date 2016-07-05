//
//  CBNBookMarsksCell.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/29.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookMarsksCell.h"
#import "CBNbookmarksView.h"

@interface CBNBookMarsksCell ()

@property (nonatomic, strong) CBNbookmarksView *bookMaskView;

@end

@implementation CBNBookMarsksCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        [self addSubview:self.bookMaskView];
        self.dk_backgroundColorPicker =  DKColorPickerWithKey(默认背景颜色);

        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, screen_Width*0.12*2 +_bookMaskView.frame.size.height);
        
    }
    
    return self;
}

- (CBNbookmarksView *)bookMaskView
{
    if (!_bookMaskView) {
        
        self.bookMaskView = [[CBNbookmarksView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
        
    }
    
    return _bookMaskView;
}



@end
