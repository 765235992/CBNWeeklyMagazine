//
//  CBNSubscriptionVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNSubscriptionVC.h"

@interface CBNSubscriptionVC ()

@end

@implementation CBNSubscriptionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @" 订阅信息 ";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    self.navigationController.navigationBar.dk_tintColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
