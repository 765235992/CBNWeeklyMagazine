//
//  CBNVideoVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/5.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNVideoVC.h"
#import "CBNVideoPlayer.h"

@interface CBNVideoVC ()

@end

@implementation CBNVideoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBarButtonItems];
    CBNVideoPlayer *videoPlayerView = [[CBNVideoPlayer alloc] initWithFrame:CGRectMake(0, 20, screen_Width, screen_Width/2)];
    
    videoPlayerView.backgroundColor = [UIColor redColor];
    
    [self.view addSubview:videoPlayerView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}



@end
