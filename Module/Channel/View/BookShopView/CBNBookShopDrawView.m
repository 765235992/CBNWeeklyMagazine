//
//  CBNBookShopDrawView.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookShopDrawView.h"
#import "CBNBookShopDrawItemView.h"

@interface CBNBookShopDrawView ()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *moreButton;
@end

@implementation CBNBookShopDrawView


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.userInteractionEnabled = YES;
        [self addSubview:self.titleLabel];
        [self addSubview:self.moreButton];
        [self createItemViews];
    }
    return self;
}

- (UILabel *)titleLabel
{
    if (!_titleLabel) {
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 20, screen_Width, 44)];
        
        _titleLabel.text = @"最新杂志";
        
        _titleLabel.textColor = [UIColor whiteColor];
        _titleLabel.font = font_px_Medium(fontSize(48.0,40.0,36.0));
        _titleLabel.textAlignment = 1;
        
    }
    
    return _titleLabel;
}

- (UIButton *)moreButton
{
    if (!_moreButton) {

        self.moreButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        _moreButton.frame = CGRectMake(0, self.frame.size.height - 36*screen_Width/320, screen_Width*0.3, 24*screen_Width/320);
        
        _moreButton.layer.borderColor = [UIColor whiteColor].CGColor;
        
        _moreButton.layer.borderWidth = 1.0;
        
        _moreButton.layer.cornerRadius = _moreButton.frame.size.height/2;
        
        [_moreButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        [_moreButton setTitle:@"查看全部" forState:UIControlStateNormal];
        
        _moreButton.titleLabel.font = font_px_Medium(fontSize(40.0,40.0,36.0));
        
        _moreButton.center = CGPointMake(screen_Width/2, _moreButton.center.y);
        
        [_moreButton addTarget:self action:@selector(moreButton:) forControlEvents:UIControlEventTouchUpInside];
        
    }
    
    return _moreButton;
}
- (void)moreButton:(UIButton *)sender
{
    if (self.bookShop!=nil) {
        self.bookShop(sender);
    }
}
- (void)createItemViews
{
    
    CGFloat beginHeight = 64+ 18*screen_Width/320;
    
    CGFloat width = (screen_Width - 2*12*screen_Width/320- 2*18*screen_Width/320)/3;
   
    CGFloat beginWidth = 12*screen_Width/320;
    
    CGFloat height = self.frame.size.height - 60*screen_Width/320 - beginHeight;

    for (int i = 0; i < 3; i++) {
        CBNBookShopDrawItemView *bookShopDrawItemView = [[CBNBookShopDrawItemView alloc] initWithFrame:CGRectMake(beginWidth, beginHeight, width, height)];
        
        bookShopDrawItemView.backgroundColor = [UIColor clearColor];
        
        [self addSubview:bookShopDrawItemView];
        
        beginWidth = beginWidth + width + 18*screen_Width/320;
        
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(bookShopDrawItemView:)];
        
        tap.numberOfTapsRequired = 1;
        
        [bookShopDrawItemView addGestureRecognizer:tap];
    }
    
}
- (void)bookShopDrawItemView:(UIGestureRecognizer *)sender
{
    if (self.bookShopGoToIssueInfo!=nil) {
        self.bookShopGoToIssueInfo(sender.view.tag);
    }
}





@end
