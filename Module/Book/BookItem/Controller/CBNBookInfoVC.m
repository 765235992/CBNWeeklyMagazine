//
//  CBNBookInfoVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookInfoVC.h"
#import "CBNBookInfoHeaderView.h"

@interface CBNBookInfoVC ()
@property (nonatomic, strong) CBNBookInfoHeaderView *headerView;
@end

@implementation CBNBookInfoVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setBackBarButtonItem];
    self.view.backgroundColor = [UIColor whiteColor];
    [self setItemTitleWithTitle:@"目录"];
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);

    [self.view addSubview:self.headerView];
}

- (CBNBookInfoHeaderView *)headerView
{
    if (!_headerView) {
        
        self.headerView = [[CBNBookInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 0)];
                
        _headerView.bookShopItemModel = self.bookItemModel;
    }
    
    return _headerView;
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
