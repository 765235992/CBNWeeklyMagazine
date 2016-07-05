//
//  CBNSearchVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/1.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNSearchVC.h"
#import "CBNSearchBar.h"
#import "CBNColumnItemView.h"
#define Start_X 0.0f           // 第一个按钮的X坐标
#define Start_Y 100.0f           // 第一个按钮的Y坐标
#define Width_Space 0.0f        // 2个按钮之间的横间距
#define Height_Space 20.0f      // 竖间距
#define Button_Width screen_Width/3   // 高
#define Button_Height 40*screen_Width/320      // 宽
@interface CBNSearchVC ()
@property (nonatomic, strong) CBNSearchBar *searchBar;
@property (nonatomic, strong) NSMutableArray *columnArray;

@end

@implementation CBNSearchVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
//    [self setBackBarButtonItem];
    
    self.navigationItem.title = @"搜索";
    
    [self.navigationController.navigationBar setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor blueColor]}];
    
    self.navigationController.navigationBar.dk_tintColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
    
    [self.view addSubview:self.searchBar];
    
    [self setColumnItemViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#define 搜索框
- (CBNSearchBar *)searchBar
{
    if (!_searchBar) {
        
        self.searchBar = [[CBNSearchBar alloc] initWithFrame:CGRectMake(10, 10, screen_Width-20, 44)];
        
        _searchBar.backgroundColor = [UIColor redColor];
    }
    
    return _searchBar;
}

- (void)setColumnItemViews
{
    NSDictionary *allChannelColumnDic = [NSDictionary dictionaryWithDictionary:[[CBNFileManager sharedInstance] loadBasicDataTypesWithKey:channel_List_Key]];
    NSLog(@"%@",allChannelColumnDic);
    
    for (NSDictionary *tempColumnDic in [allChannelColumnDic objectForKey:@"DataList"]) {
        CBNChannelColumnModel *channelColumnModel = [[CBNChannelColumnModel alloc] initWithChannelColumnInfo:tempColumnDic];
        [self.columnArray addObject:channelColumnModel];
        
        
    }
    
    for (int i = 0; i < _columnArray.count; i++) {
        NSInteger index = i % 3;
        NSInteger page = i / 3;
        
        CBNColumnItemView *tempColumnView = [[CBNColumnItemView alloc] initWithFrame:CGRectMake(index * (Button_Width + Width_Space) + Start_X, page  * (Button_Height + Height_Space)+Start_Y, Button_Width, Button_Height)];
        
        tempColumnView.columnModel = [_columnArray objectAtIndex:i];
        
        tempColumnView.tag = i;
//        [tempColumnView setBackgroundColor:[UIColor randomColor]];
        
        [self.view addSubview:tempColumnView];
        
        [tempColumnView addTarget:self action:@selector(tempColumnView:) forControlEvents:UIControlEventTouchUpInside];
        
        
    }
    
}
- (void)tempColumnView:(UIButton *)sender
{
    NSInteger tag = sender.tag;
    NSLog(@"%@",[_columnArray objectAtIndex:tag]);
    
}

- (NSMutableArray *)columnArray
{
    if (!_columnArray) {
        
        self.columnArray = [[NSMutableArray alloc] init];
    }
    
    return _columnArray;
}
@end
