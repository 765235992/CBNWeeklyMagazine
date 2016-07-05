//
//  CBNRecommendCollectionAndShareCell.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/29.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNRecommendCollectionAndShareCell.h"
#import "CBNRecommendedAndCollectionAndShareView.h"

@interface CBNRecommendCollectionAndShareCell ()
@property (nonatomic, strong) CBNRecommendedAndCollectionAndShareView *recommendedAndCollectionAndShareView;

@end

@implementation CBNRecommendCollectionAndShareCell
- (void)dealloc
{
    NSLog(@"sadsd");
}

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;

        [self addSubview:self.recommendedAndCollectionAndShareView];
        
        self.dk_backgroundColorPicker =  DKColorPickerWithKey(默认背景颜色);

        self.frame = CGRectMake(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, screen_Width*0.12*2 +_recommendedAndCollectionAndShareView.frame.size.height);
        
        _recommendedAndCollectionAndShareView.center = CGPointMake(screen_Width/2, self.frame.size.height/2);

      
    }
    
    return self;
}

- (CBNRecommendedAndCollectionAndShareView *)recommendedAndCollectionAndShareView
{
    if (!_recommendedAndCollectionAndShareView) {
        
        self.recommendedAndCollectionAndShareView = [[CBNRecommendedAndCollectionAndShareView alloc] initWithFrame:CGRectMake(0, 0, screen_Width*0.12*2, 17*screen_Width/320) andClearance:30.0*screen_Width/320];
        
    }
    
    return _recommendedAndCollectionAndShareView;
}














@end
