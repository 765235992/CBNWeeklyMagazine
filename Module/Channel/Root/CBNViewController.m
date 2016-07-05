//
//  CBNViewController.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNViewController.h"

@interface CBNViewController ()

@end

@implementation CBNViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIImage *)screenImage
{
    UIGraphicsBeginImageContext(self.view.bounds.size);     //currentView 当前的view  创建一个基于位图的图形上下文并指定大小为
    [self.view.layer renderInContext:UIGraphicsGetCurrentContext()];//renderInContext呈现接受者及其子范围到指定的上下文
    UIImage *tempImage = UIGraphicsGetImageFromCurrentImageContext();//返回一个基于当前图形上下文的图片
    UIGraphicsEndImageContext();//移除栈顶的基于当前位图的图形上下文
    UIImageWriteToSavedPhotosAlbum(tempImage, nil, nil, nil);//然后将该图片保存到图片图
    
    return tempImage;
}

@end
