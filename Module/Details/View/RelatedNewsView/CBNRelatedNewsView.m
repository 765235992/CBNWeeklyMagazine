//
//  CBNRelatedNewsView.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/29.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNRelatedNewsView.h"
#import "CBNRelatedNewsItem.h"
#import "CBNRelatedNewsLayout.h"

@interface CBNRelatedNewsView ()<UICollectionViewDataSource, UICollectionViewDelegateFlowLayout,UICollectionViewDelegate,UIScrollViewDelegate>
@property (nonatomic, strong) UILabel *bookMarksLabel;

@property (nonatomic, strong) UIImageView *leftImageView;
@property (nonatomic, strong) UIImageView *rightImageView;
@property (nonatomic, strong) UICollectionView *aCollectionView;

@property (nonatomic, strong) NSMutableArray *sourceArray;

@end

@implementation CBNRelatedNewsView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self addSubview:self.bookMarksLabel];
        
        [self addSubview:self.leftImageView];
        [self addSubview:self.rightImageView];
        _leftImageView.center = CGPointMake(_leftImageView.center.x, _bookMarksLabel.center.y);
        _rightImageView.center = CGPointMake(_rightImageView.center.x, _bookMarksLabel.center.y);        self.sourceArray = [[NSMutableArray alloc] init];
        [_sourceArray addObject:@"1"];
        [_sourceArray addObject:@"1"];
        [_sourceArray addObject:@"1"];
        [_sourceArray addObject:@"1"];
        [_sourceArray addObject:@"1"];

        [_sourceArray addObject:@"1"];
        [self addSubview:self.aCollectionView];
        [self.aCollectionView registerClass:[CBNRelatedNewsItem class] forCellWithReuseIdentifier:@"CBNRelatedNewsItem"];
        self.viewForLastBaselineLayout.backgroundColor = [UIColor clearColor];
    }
    return self;
}
- (UILabel *)bookMarksLabel
{
    if (!_bookMarksLabel) {
        
        self.bookMarksLabel = [[UILabel alloc] init];
        
        _bookMarksLabel.backgroundColor =  [UIColor clearColor];
        
        _bookMarksLabel.dk_textColorPicker = DKColorPickerWithKey(白色背景上的默认标签字体颜色);

        _bookMarksLabel.font = font_px_Medium(fontSize(36.0,32.0,28.0));
        
        _bookMarksLabel.text = @"推荐观看";
        
        [_bookMarksLabel sizeToFit];
        
        _bookMarksLabel.frame = CGRectMake(0, 0, _bookMarksLabel.frame.size.width+15*screen_Width/320, _bookMarksLabel.frame.size.height);
        
        _bookMarksLabel.textAlignment = 1;
        
        _bookMarksLabel.text = @"推荐观看";
        
        
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

- (UICollectionView *)aCollectionView
{
    if (!_aCollectionView) {
        CBNRelatedNewsLayout* projectLayout = [[CBNRelatedNewsLayout alloc] init];
        
        self.aCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, _bookMarksLabel.frame.size.height + screen_Width*0.015, screen_Width, screen_Width * 0.37*0.6) collectionViewLayout:projectLayout];
        
        _aCollectionView.delegate = self;
        
        _aCollectionView.dataSource = self;
        
        _aCollectionView.backgroundColor = [UIColor clearColor];
        _aCollectionView.showsVerticalScrollIndicator = FALSE;
        _aCollectionView.showsHorizontalScrollIndicator = FALSE;
        
    }
    
    return _aCollectionView;
}


- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    return self.sourceArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    CBNRelatedNewsItem *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CBNRelatedNewsItem" forIndexPath:indexPath];
    
//    cell.projectModel = [_sourceArray objectAtIndex:indexPath.row];
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

    if (self.relatedNewsItemClicked!=nil) {
        self.relatedNewsItemClicked(indexPath,nil);
    }
}
-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation {
    return UIInterfaceOrientationIsLandscape(toInterfaceOrientation);
}

@end
