//
//  CBNBigImageItemView.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/5.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBigImageItemView.h"
#import "UIImageView+WebCache.h"
@interface UIImage (HIUtil)

- (CGSize)sizeThatFits:(CGSize)size;

@end

@implementation UIImage (HIUtil)

- (CGSize)sizeThatFits:(CGSize)size
{
    CGSize imageSize = CGSizeMake(self.size.width / self.scale,
                                  self.size.height / self.scale);
    
    CGFloat widthRatio = imageSize.width / size.width;
    
    CGFloat heightRatio = imageSize.height / size.height;
    
    if (widthRatio > heightRatio) {
        
        imageSize = CGSizeMake(imageSize.width / widthRatio, imageSize.height / widthRatio);
        
    } else {
        
        imageSize = CGSizeMake(imageSize.width / heightRatio, imageSize.height / heightRatio);
        
    }
    
    return imageSize;
}

@end


@interface UIImageView (HIUtil)

- (CGSize)contentSize;

@end

@implementation UIImageView (HIUtil)

- (CGSize)contentSize
{
    return [self.image sizeThatFits:self.bounds.size];
}

@end
@interface CBNBigImageItemView () <UIScrollViewDelegate,UIGestureRecognizerDelegate>

@property (nonatomic, strong) UIView *containerView;

@property (nonatomic, strong) UIImageView *imageView;

@property (nonatomic) BOOL rotating;

@property (nonatomic) CGSize minSize;

@end
@implementation CBNBigImageItemView
- (instancetype)initWithFrame:(CGRect)frame andImage:(UIImage *)image
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.delegate = self;
        
        self.bouncesZoom = YES;
        
        // Add container view
        UIView *containerView = [[UIView alloc] initWithFrame:self.bounds];
        
        containerView.backgroundColor = [UIColor clearColor];
        
        [self addSubview:containerView];
        
        _containerView = containerView;
        
        // Add image view
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        
        imageView.frame = containerView.bounds;
        
        imageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [containerView addSubview:imageView];
        
        _imageView = imageView;
        
        // Fit container view's size to image size
        CGSize imageSize = imageView.contentSize;
        
        //NSLog(@"%f  %f",imageSize.width,imageSize.height);
        self.containerView.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
        
        imageView.bounds = CGRectMake(0, 0, imageSize.width, imageSize.height);
        
        imageView.center = CGPointMake(imageSize.width / 2, imageSize.height / 2);
        
        self.contentSize = imageSize;
        
        self.minSize = imageSize;
        
        
        [self setMaxMinZoomScale];
        
        // Center containerView by set insets
        [self centerContent];
        
        // Setup other events
        [self setupGestureRecognizer];
        
        [self setupRotationNotification];
        
    }
    
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.rotating) {
        
        self.rotating = NO;
        
        // update container view frame
        CGSize containerSize = self.containerView.frame.size;
        
        BOOL containerSmallerThanSelf = (containerSize.width < CGRectGetWidth(self.bounds)) && (containerSize.height < CGRectGetHeight(self.bounds));
        
        CGSize imageSize = [self.imageView.image sizeThatFits:self.bounds.size];
        
        CGFloat minZoomScale = imageSize.width / self.minSize.width;
        
        self.minimumZoomScale = minZoomScale;
        
        if (containerSmallerThanSelf || self.zoomScale == self.minimumZoomScale) { // 宽度或高度 都小于 self 的宽度和高度
            
            self.zoomScale = minZoomScale;
            
        }
        
        // Center container view
        [self centerContent];
    }
}
- (void)setImageURL:(NSString *)imageURL
{
    
    
//        [_imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] placeholderImage:_imageView.image];
    NSLog(@"%@",imageURL);

    [_imageView sd_setImageWithURL:[NSURL URLWithString:imageURL] completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, NSURL *imageURL) {
        _imageView.image = image;
        [self upDataImage:image];

    }];
    
//        HLImageRequestHelper *helper = [[HLImageRequestHelper alloc] init];
//    
//    
//        __weak typeof(self) weakSelf = self;
//    
//    
//        [helper loadImageWithImageURL:imageURL imageDownloadSecuessed:^(UIImage *image) {
//    
//            [weakSelf upDataImage:image];
//    
//        }];
    
}

- (void)upDataImage:(UIImage *)image
{
    
    //NSLog(@"图片是否有？？ %@",image);
    _imageView.image = image;
    
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    
    CGSize imageSize = _imageView.contentSize;
    
    self.containerView.frame = CGRectMake(0, 0, imageSize.width, imageSize.height);
    
    _imageView.bounds = CGRectMake(0, 0, imageSize.width, imageSize.height);
    
    _imageView.center = CGPointMake(imageSize.width / 2, imageSize.height / 2);
    
    self.contentSize = imageSize;
    
    self.minSize = imageSize;
    
    
    [self setMaxMinZoomScale];
    
    // Center containerView by set insets
    [self centerContent];
}
- (void)dealloc
{
    //NSLog(@"图集单个释放了");
    
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}
/*
 手势识别的结果
 oneClicked 单击
 longPress 长按
 */
- (void)gesturesResultsOneClcked:(oneClicked)oneClicked longPress:(longPress)longPress
{
    self.oneClicked = oneClicked;
    
    self.longPress = longPress;
}
#pragma mark - Setup

- (void)setupRotationNotification
{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(orientationChanged:)
                                                 name:UIApplicationDidChangeStatusBarOrientationNotification
                                               object:nil];
}

- (void)setupGestureRecognizer
{
    //双击
    UITapGestureRecognizer *tapGestureRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapHandler:)];
    
    tapGestureRecognizer.numberOfTapsRequired = 2;
    
    [_containerView addGestureRecognizer:tapGestureRecognizer];
    
    //单击
    UITapGestureRecognizer *clickedOne = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(clickedOne:)];
    
    clickedOne.numberOfTapsRequired = 1;
    
    [_containerView addGestureRecognizer:clickedOne];
    
    [self addGestureRecognizer:clickedOne];
    
    [clickedOne requireGestureRecognizerToFail:tapGestureRecognizer];
    
    //添加长摁手势
    UILongPressGestureRecognizer *longPressGesture = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressGesture:)];
    
    //设置长按时间
    longPressGesture.minimumPressDuration = 0.5;//(2秒)
    
    [_containerView addGestureRecognizer:longPressGesture];
}

#pragma mark - UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView
{
    
    return self.containerView;
}

- (void)scrollViewDidZoom:(UIScrollView *)scrollView
{
    [self centerContent];
}

#pragma mark - GestureRecognizer

- (void)tapHandler:(UITapGestureRecognizer *)recognizer
{
    if (self.zoomScale > self.minimumZoomScale) {
        
        [self restoreImage];
        
    } else if (self.zoomScale < self.maximumZoomScale) {
        
        CGPoint location = [recognizer locationInView:recognizer.view];
        
        CGRect zoomToRect = CGRectMake(0, 0, 50, 50);
        
        zoomToRect.origin = CGPointMake(location.x - CGRectGetWidth(zoomToRect)/2, location.y - CGRectGetHeight(zoomToRect)/2);
        
        [self zoomToRect:zoomToRect animated:YES];
        
    }
}

- (void)clickedOne:(UITapGestureRecognizer *)recognizer
{
    //NSLog(@"点击了一下");
    
    if (self.oneClicked!=nil) {
        self.oneClicked(self);
        
    }
    
}
//常摁手势触发方法
-(void)longPressGesture:(id)sender
{
    
    UILongPressGestureRecognizer *longPress = sender;
    
    if (longPress.state == UIGestureRecognizerStateEnded)
        
    {
        
        if (self.longPress!= nil) {
            
            self.longPress(self);
            
        }
        
        //NSLog(@"长按触发了");
        
    }
    
}
#pragma mark - Notification

- (void)orientationChanged:(NSNotification *)notification
{
    self.rotating = YES;
}

#pragma mark - Helper

- (void)setMaxMinZoomScale
{
    CGSize imageSize = self.imageView.image.size;
    
    CGSize imagePresentationSize = self.imageView.contentSize;
    
    CGFloat maxScale = MAX(imageSize.height / imagePresentationSize.height, imageSize.width / imagePresentationSize.width);
    
    self.maximumZoomScale = MAX(1, maxScale); // Should not less than 1
    
    self.minimumZoomScale = 1.0;
    
}

- (void)centerContent
{
    CGRect frame = self.containerView.frame;
    
    CGFloat top = 0, left = 0;
    
    if (self.contentSize.width < self.bounds.size.width) {
        
        left = (self.bounds.size.width - self.contentSize.width) * 0.5f;
        
    }
    if (self.contentSize.height < self.bounds.size.height) {
        
        top = (self.bounds.size.height - self.contentSize.height) * 0.5f;
        
    }
    
    top -= frame.origin.y;
    
    left -= frame.origin.x;
    
    self.contentInset = UIEdgeInsetsMake(top, left, top, left);
}
/*
 图片复原
 */
- (void)restoreImage
{
    [self setZoomScale:self.minimumZoomScale animated:YES];
    
    
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
