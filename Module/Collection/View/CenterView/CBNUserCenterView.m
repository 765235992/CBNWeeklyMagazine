//
//  CBNUserCenterView.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/28.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNUserCenterView.h"
#import "CBNUserCenterCell.h"
#import "CBNUserCenterHeaderView.h"

@interface CBNUserCenterView ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *aTableView;

@property (nonatomic, strong) CBNUserCenterHeaderView *headerView;
@property (nonatomic, strong) NSArray *sourceArray;
@end


@implementation CBNUserCenterView

- (void)dealloc
{
    
}
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self) {
        
        self.sourceArray = [NSArray arrayWithObjects:@"收藏",@"摘录",@"离线杂志",@"订阅信息",@"设置", nil];
        [self addSubview:self.aTableView];
        
        self.userInteractionEnabled = YES;
    }
    
    return self;
}

- (UITableView *)aTableView
{
    if (!_aTableView) {
        
        self.aTableView = [[UITableView alloc] initWithFrame:self.bounds];
        
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
    
        self.headerView = [[CBNUserCenterHeaderView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, 0)];
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
    return  30 *screen_Width/320 + 20;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if ([self.delegate respondsToSelector:@selector(userCenterDrawViewDidSelectedAtIndex:)]) {
        [self.delegate userCenterDrawViewDidSelectedAtIndex:indexPath.row];
    }
}
@end
