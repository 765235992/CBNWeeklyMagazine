//
//  CBNInfomationVC.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/28.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNInfomationVC.h"

@interface CBNInfomationVC ()

@end

@implementation CBNInfomationVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent= NO;
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithColors([UIColor whiteColor],RGBColor(3, 3, 3, 0.6),[UIColor orangeColor]);
    [self.navigationController.navigationBar setBackgroundImage:[[UIColor clearColor] colorImage] forBarMetrics:UIBarMetricsDefault];
    [self.navigationController.navigationBar setShadowImage:[UIColorFromRGB(0xE7E7E7) colorImage]];

}
- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar setShadowImage:[[UIColor clearColor] colorImage]];

}
- (void)viewDidLoad {
    [super viewDidLoad];
//    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithColors(RGBColor(230, 230, 230, 0.9),RGBColor(3, 3, 3, 0.6),[UIColor orangeColor]);
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#define mark setBarButtonItems


- (void)setClearItemTitle
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @" 1 ";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor clearColor]}];
}
- (void)setBarButtonItems
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @" 1 ";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor clearColor]}];

    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton dk_setImage:DKImagePickerWithImages([UIImage imageNamed:@"white_back_image_Day.png"],[UIImage imageNamed:@"white_back_image_Day.png"],[UIImage imageNamed:@"white_back_image_Day.png"]) forState:UIControlStateNormal];
    
    backButton.frame = CGRectMake(0, 0, 25, 25);
    
    [backButton addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBar = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    leftSpacer.width = -10;
    
    self.navigationItem.leftBarButtonItems = @[leftSpacer,backBar];
    
    UIButton *fontButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [fontButton dk_setImage:DKImagePickerWithImages([UIImage imageNamed:@"font_image_Day.png"],[UIImage imageNamed:@"font_image_Day.png"],[UIImage imageNamed:@"font_image_Day.png"]) forState:UIControlStateNormal];
    
    fontButton.frame = CGRectMake(0, 0, 25, 25);
    
    [fontButton addTarget:self action:@selector(fontButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *fontBar = [[UIBarButtonItem alloc] initWithCustomView:fontButton];
    
    UIButton *nightButton = [UIButton buttonWithType:UIButtonTypeCustom];
    [nightButton dk_setImage:DKImagePickerWithImages([UIImage imageNamed:@"moon_image_Night.png"],[UIImage imageNamed:@"moon_image_Night.png"],[UIImage imageNamed:@"moon_image_Night.png"]) forState:UIControlStateNormal];
    
    nightButton.frame = CGRectMake(0, 0, 25, 25);
    
    [nightButton addTarget:self action:@selector(nightButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *nightBar = [[UIBarButtonItem alloc] initWithCustomView:nightButton];
    UIBarButtonItem *rightSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    rightSpacer.width = -10;

    self.navigationItem.rightBarButtonItems = @[rightSpacer,nightBar,fontBar];
    
}
- (void)backButton:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)fontButton:(id)sender
{
    
}

- (void)nightButton:(id)sender
{
    
    if ([self.dk_manager.themeVersion isEqualToString:DKThemeVersionNight]) {
        
        [self.dk_manager dawnComing];
        
        
    } else {
        
        [self.dk_manager nightFalling];
        
    }
    [[NSNotificationCenter defaultCenter] postNotificationName:@"dayAndNightChange" object:nil];

}

- (void)setBackBarButtonItem
{
    UIButton *backButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    [backButton dk_setImage:DKImagePickerWithImages([UIImage imageNamed:@"white_back_image_Day.png"],[UIImage imageNamed:@"white_back_image_Day.png"],[UIImage imageNamed:@"white_back_image_Day.png"]) forState:UIControlStateNormal];
    
    backButton.frame = CGRectMake(0, 0, 44, 44);
    [backButton setImageEdgeInsets:UIEdgeInsetsMake(10, 0, 10, 20)];
    
    [backButton addTarget:self action:@selector(backButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *backBar = [[UIBarButtonItem alloc] initWithCustomView:backButton];
    
    UIBarButtonItem *leftSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    leftSpacer.width = -8;
    
    self.navigationItem.leftBarButtonItems = @[leftSpacer,backBar];
}
- (void)setItemTitleWithTitle:(NSString *)title
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @" 1 ";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor clearColor]}];
    
    UILabel *navigationLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 44)];
    navigationLabel.text = title;
    navigationLabel.textAlignment = NSTextAlignmentCenter;
    navigationLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
    navigationLabel.font = font_px_Medium(16.0);
    navigationLabel.backgroundColor = [UIColor orangeColor];
    
    self.navigationItem.titleView = navigationLabel;
}

- (void)serRightBarButtonWithText:(NSString *)text
{
    UIButton *textButton = [UIButton buttonWithType:UIButtonTypeCustom];
    
    
    
    textButton.frame = CGRectMake(0, 0, 44, 44);
    [textButton dk_setTitleColorPicker:DKColorPickerWithKey(新闻大标题字体颜色) forState:UIControlStateNormal];
    textButton.backgroundColor = [UIColor redColor];
    
    [textButton setTitle:text forState:UIControlStateNormal];
    textButton.titleLabel.font = font_px_Regular(16.0);

    textButton.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    [textButton addTarget:self action:@selector(textButton:) forControlEvents:UIControlEventTouchUpInside];
    
    UIBarButtonItem *textBar = [[UIBarButtonItem alloc] initWithCustomView:textButton];
    
    UIBarButtonItem *rightSpacer = [[UIBarButtonItem alloc]initWithBarButtonSystemItem:UIBarButtonSystemItemFixedSpace target:nil action:nil];
    
    rightSpacer.width = -8;
    
    self.navigationItem.rightBarButtonItems = @[rightSpacer,textBar];

}
- (void)textButton:(UIButton *)sender
{
    
}
@end
