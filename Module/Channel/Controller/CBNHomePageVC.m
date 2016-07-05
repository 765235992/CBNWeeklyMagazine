//
//  CBNHomePageVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNHomePageVC.h"
#import "CBNHomePageNewsRequest.h"
#import "CBNRecommendHeaderView.h"
#import "CBNProjectArrayCell.h"
#import "CBNWebNewsDetailVC.h"
#import "CBNNewsItemModel.h"
#import "CBNAudioNewsCell.h"
#import "CBNVideoNewsCell.h"
#import "CBNNormalNewsCell.h"
#import "CBNRecommendNewsCell.h"
#import "CBNVideoVC.h"

#define collection_width (((screen_Width - 45)/4.0)) + 20

@interface CBNHomePageVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *aTableView;
@property (nonatomic, strong) CBNRecommendHeaderView *headerView;
@property (nonatomic, strong) NSMutableArray *sourceArray;
@end

@implementation CBNHomePageVC

- (void)viewDidLoad
{
    [super viewDidLoad];
        
    self.view.backgroundColor = [UIColor clearColor];

  
    [self setUpTableView];

    
    
}
#define 添加刷新效果和加载更多效果
- (void)setUpTableView
{
    
    [self.view addSubview:self.aTableView];
    
    _aTableView.tableHeaderView = self.headerView;
    
    // 设置回调（一旦进入刷新状态，就调用target的action，也就是调用self的loadNewData方法）
    MJRefreshNormalHeader *header = [MJRefreshNormalHeader headerWithRefreshingTarget:self refreshingAction:@selector(refreshHomePageDataFromSever)];
    
    // 设置文字
    [header setTitle:@"下拉开始刷新" forState:MJRefreshStateIdle];
    
    [header setTitle:@"正在刷新" forState:MJRefreshStatePulling];
    
    [header setTitle:@"正在加载中......" forState:MJRefreshStateRefreshing];
    
    // 设置字体
    header.stateLabel.font = font_px_Medium(fontSize(36.0,36.0,36.0));
    
    header.lastUpdatedTimeLabel.font = font_px_Medium(fontSize(32.0,32.0,32.0));
    
    // 设置颜色
    header.stateLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
    
    header.lastUpdatedTimeLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
    
    // 设置刷新控件
    self.aTableView.mj_header = header;
    
    [_aTableView.mj_header beginRefreshing];
    
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreHomePageDataFromSever)];
    
    [footer setTitle:@" " forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载更多数据……" forState:MJRefreshStateRefreshing];
    
    [footer setTitle:@"没有更多数据" forState:MJRefreshStateNoMoreData];
    
    // 设置字体
    footer.stateLabel.font = font_px_Medium(fontSize(32.0,32.0,32.0));
    
    // 设置颜色
    footer.stateLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
    
    // 设置footer
    self.aTableView.mj_footer = footer;
    

}
#define 数据加载和刷新
- (void)refreshHomePageDataFromSever
{
    
    __weak typeof(self) weakSelf = self;
    
    [[CBNHomePageNewsRequest sharedInstance] refreshHomePageNewsFromSeverWith:0 success:^(NSMutableArray *homePageModelrray, NSMutableArray *sliderArray) {
        
        [self.sourceArray removeAllObjects];
        
        NSMutableArray *arr = [[NSMutableArray alloc] init];
        
        for (CBNNewsItemModel *tempModel in sliderArray) {
            CBNShufflingModel *shufflingModel = [[CBNShufflingModel alloc] init];
            

            shufflingModel.newsTitleStr = tempModel.chapt_title;
            shufflingModel.newsThumbStr = tempModel.cover_img_big;
            shufflingModel.index = [tempModel.type integerValue];
            
            [arr addObject:shufflingModel];

        }
        weakSelf.headerView.sliderView.shufflingView.sourceModelArray = arr;
        
        [_sourceArray addObjectsFromArray:homePageModelrray];
        
        [weakSelf refreshFinished];

    } failed:^(NSString *errorStr) {
        
        [weakSelf refreshFinished];

    }];
    
    
}
- (void)refreshFinished
{
    
    [_aTableView reloadData];
    
    [_aTableView.mj_header endRefreshing];
    
}
- (void)loadMoreHomePageDataFromSever
{

    __weak typeof(self) weakSelf = self;

    [[CBNHomePageNewsRequest sharedInstance] loadMoreHomePageNewsFromSeverWith:0 success:^(NSMutableArray *homePageModelrray) {
        [_sourceArray addObjectsFromArray:homePageModelrray];
        [weakSelf loadMoreFinished];

    } failed:^(NSString *errorStr) {
        [weakSelf loadMoreFinished];

    }];
}
- (void)loadMoreFinished
{
    [_aTableView reloadData];
    [_aTableView.mj_footer endRefreshing];
}
#define mark aTableView

- (UITableView *)aTableView
{
    if (!_aTableView) {
        self.aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height)];
        _aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _aTableView.contentInset = UIEdgeInsetsMake(64+segmentViewHeight, 0, 0, 0);
        _aTableView.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);
        _aTableView.delegate = self;
        
        _aTableView.dataSource = self;
    }
    
    return _aTableView;
}
#define markaTableView delegate dataSource

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sourceArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CBNNewsItemModel *channelModel = [_sourceArray objectAtIndex:indexPath.row];
    NSLog(@"chaptID %@  issueID %@",channelModel.chapt_id,channelModel.issue_id);
    
    if (indexPath.row == 0) {
        static NSString *identifier = @"CBNProjectArrayCell";
        
        CBNProjectArrayCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        __weak typeof(self) weakSelf = self;
        
        if (cell == nil) {
            
            cell = [[CBNProjectArrayCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
            cell.projectCollectionView.projectCellClicked = ^(NSIndexPath *indexPath, CBNProjectNewsItemModel *projectModel)
            {
                
                [weakSelf goToWebNewsDetailVCWithProjectNewsItem:projectModel];
                
            };
            
        }
        
        [_sourceArray replaceObjectAtIndex:indexPath.row withObject:channelModel];
        
        return cell;
        
    }else if ([channelModel.DataType integerValue] == 2){
        
        static NSString *identifier = @"CBNVideoNewsCell";
        
        
        CBNVideoNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell == nil) {
            
            cell = [[CBNVideoNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
        }
        
        cell.newsItemModel = channelModel;
        
        return cell;
        
    }else if ([channelModel.type integerValue] == 1){
        static NSString *identifier = @"CBNRecommendNewsCell";
        
        
        CBNRecommendNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell == nil) {
            
            cell = [[CBNRecommendNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
        }
        cell.newsItemModel = channelModel;
        
        return cell;
    }else{
        static NSString *identifier = @"CBNNormalNewsCell";
        
        
        CBNNormalNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
        
        if (cell == nil) {
            
            cell = [[CBNNormalNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
            
        }
        
        cell.newsItemModel = channelModel;
        
        channelModel = cell.newsItemModel ;
        
        [_sourceArray replaceObjectAtIndex:indexPath.row withObject:channelModel];
        
        return cell;
        
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        return collection_width/4+15;
    }
    CBNNewsItemModel *channelModel = [_sourceArray objectAtIndex:indexPath.row];
    
    if (channelModel.height == 0.0 ) {
        return 100;
    }
    return channelModel.height;
    
    
}

//.
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row != 0) {
        CBNNewsItemModel *channelModel = [_sourceArray objectAtIndex:indexPath.row];
        if ([channelModel.DataType isEqualToString:@"2"]) {
            CBNVideoVC *videoVC = [[CBNVideoVC alloc] init];
            
            [self.navigationController pushViewController:videoVC animated:YES];
            
        }else{
            CBNTextArticleVC *ar = [[CBNTextArticleVC alloc] init];
            
            [self.navigationController pushViewController:ar animated:YES];
        }
    }


}
- (void)goToWebNewsDetailVCWithProjectNewsItem:(CBNProjectNewsItemModel *)projectNewsItem
{
    CBNWebNewsDetailVC *webNewsDetailVC = [[CBNWebNewsDetailVC alloc]init];
    
    webNewsDetailVC.projectNewsItemModel = projectNewsItem;
    
    [self.navigationController pushViewController:webNewsDetailVC animated:YES];
}
#define markheaderView
- (CBNRecommendHeaderView *)headerView
{
    if (!_headerView) {
        
        self.headerView = [[CBNRecommendHeaderView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Width*0.75 )];
        
        _headerView.sliderView.shufflingView.imageViewDidTapAtIndex = ^(CBNShufflingModel *shufflingModel){
            CBNTextArticleVC *ar = [[CBNTextArticleVC alloc] init];
            
            [self.navigationController pushViewController:ar animated:YES];
        };
        
    }
    
    return _headerView;
}
#define 创建用来装数据的数组
- (NSMutableArray *)sourceArray
{
    if (!_sourceArray) {
        
        self.sourceArray = [[NSMutableArray alloc] init];
        
    }
    
    return _sourceArray;
}
@end