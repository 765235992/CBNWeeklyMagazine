//
//  CBNUserCenterDrawVC.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNUserCenterDrawVC.h"
#import "CBNUserCenterCell.h"
#import "CBNUserCenterHeaderView.h"


@interface CBNUserCenterDrawVC ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) CBNUserCenterHeaderView *headerView;

@property (nonatomic, strong) UITableView *aTableView;

@property (nonatomic, strong) NSArray *sourceArray;

@end

@implementation CBNUserCenterDrawVC

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
}
- (void)viewDidLoad
{
    [super viewDidLoad];

    self.navigationController.navigationBarHidden = YES;
    
    self.edgesForExtendedLayout = UIRectEdgeNone;
    
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(文章详情推荐标签背景颜色);
    
    self.sourceArray = [NSArray arrayWithObjects:@"收藏",@"摘录",@"离线杂志",@"订阅信息",@"设置", nil];
    [self.view addSubview:self.aTableView];
}

- (UITableView *)aTableView
{
    if (!_aTableView) {
        
        self.aTableView = [[UITableView alloc] initWithFrame:self.view.bounds];
        
        _aTableView.backgroundColor = [UIColor clearColor];
        
        _aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _aTableView.delegate = self;
        
        _aTableView.dataSource = self;
        
        _aTableView.tableHeaderView = self.headerView;
        
    }
    
    return _aTableView;
}

- (CBNUserCenterHeaderView *)headerView
{
    if (!_headerView) {
        
        self.headerView = [[CBNUserCenterHeaderView alloc] initWithFrame:self.view.bounds];
    }
    
    
    return _headerView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _sourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *str = @"CBNUserCenterCell";
    
    CBNUserCenterCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
    
    if (!cell) {
        
        cell = [[CBNUserCenterCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
        
    }
    
    cell.text = [_sourceArray objectAtIndex:indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    CGFloat height = [NSString heightForStringFontSize:fontSize(36,32,36)];
    return  2*12 *screen_Width/320+height;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dic = [NSDictionary dictionaryWithObject:indexPath forKey:@"tableViewClicked"];
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"userCenterItemClicked" object:nil userInfo:dic];
}

@end
