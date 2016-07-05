//
//  CBNWebNewsDetailVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNWebNewsDetailVC.h"

@interface CBNWebNewsDetailVC ()
@property (nonatomic, strong) UIWebView *adWebView;
@property (nonatomic, strong) UIView *maskView;
@property (nonatomic, strong) UIButton *backButton;
@end

@implementation CBNWebNewsDetailVC

- (void)dealloc
{
    NSLog(@"广告链接释放");
    
}
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent= NO;
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithColors([UIColor whiteColor],RGBColor(3, 3, 3, 0.6),[UIColor orangeColor]);
    [self.navigationController.navigationBar setBackgroundImage:[[UIColor clearColor] colorImage] forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBarHidden = YES;
}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
  

}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];

    
    [self setClearItemTitle];
    
    [self setBackBarButtonItem];
    
    
    [self.view addSubview:self.adWebView];
    
    [_adWebView addSubview:self.maskView];
    
    [self.view addSubview:self.backButton];

    NSURL *webUrl = [NSURL URLWithString:self.projectNewsItemModel.url];
    
    NSURLRequest *request =[NSURLRequest requestWithURL:webUrl cachePolicy:NSURLRequestReloadRevalidatingCacheData timeoutInterval:60];
    
    [self.adWebView loadRequest:request];
}
- (UIWebView *)adWebView
{
    if (!_adWebView) {
        
        self.adWebView = [[UIWebView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
        
    }
    
    return _adWebView;
}
- (UIView *)maskView
{
    if (!_maskView) {
        
        self.maskView = [[UIView alloc] initWithFrame:self.view.bounds];
        
        _maskView.dk_backgroundColorPicker = image_Back_Mask;
        
        _maskView.userInteractionEnabled = NO;
        
        _maskView.multipleTouchEnabled = YES;
        
    }
    
    return _maskView;
}

- (UIButton *)backButton
{
    if (!_backButton) {
        
        self.backButton = [UIButton buttonWithType:UIButtonTypeCustom];
        
        [_backButton dk_setImage:DKImagePickerWithImages([UIImage imageNamed:@"white_back_image_Day.png"],[UIImage imageNamed:@"white_back_image_Day.png"],[UIImage imageNamed:@"white_back_image_Day.png"]) forState:UIControlStateNormal];
        
        _backButton.backgroundColor = [UIColor blackColor];
        
        _backButton.frame = CGRectMake(10, 30, 25*screen_Width/320, 25*screen_Width/320);
        _backButton.layer.cornerRadius = _backButton.frame.size.height/2;
        
        [_backButton addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];

    }
    
    return _backButton;
}
- (void)backButton:(id)sender
{
    
    [self.navigationController popViewControllerAnimated:YES];
    self.navigationController.navigationBar.translucent = NO;
    self.navigationController.navigationBarHidden = NO;
}

@end
