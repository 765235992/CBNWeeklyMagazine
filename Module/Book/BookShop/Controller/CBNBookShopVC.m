//
//  CBNBookShopVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBookShopVC.h"
#import "CBNBookShopLayout.h"
#import "CBNBookShopItemCell.h"
#import "CBNBookShopRequest.h"
#import "CBNBookShopItemModel.h"
#import "CBNBookInfoVC.h"

@interface CBNBookShopVC ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UICollectionView *aCollectionView;
@property (nonatomic, assign) CGFloat bookItemHeight;
@property (nonatomic, strong) CBNBookShopRequest *bookShopRequest;
@property (nonatomic, strong) NSMutableArray *sourceArray;
@property (nonatomic, assign) NSInteger page;

@end

@implementation CBNBookShopVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBarHidden = NO;
    self.navigationController.navigationBar.translucent = NO;

}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.bookItemHeight = 0.0;
    [self setBackBarButtonItem];
    self.view.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);
    [self setItemTitleWithTitle:@"书店"];
    [self serRightBarButtonWithText:@"全部"];
    
    [self.view addSubview:self.aCollectionView];
    [self loadData];
    [self setLoadMoreDataFoot];
    
    
}
- (void)setLoadMoreDataFoot
{
    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreBookShopDataFromSever)];
    
    [footer setTitle:@" " forState:MJRefreshStateIdle];
    
    [footer setTitle:@"正在加载更多数据……" forState:MJRefreshStateRefreshing];
    
    [footer setTitle:@"没有更多数据" forState:MJRefreshStateNoMoreData];
    
    // 设置字体
    footer.stateLabel.font = font_px_Medium(fontSize(32.0,32.0,32.0));
    
    // 设置颜色
    footer.stateLabel.dk_textColorPicker = DKColorPickerWithKey(新闻大标题字体颜色);
    
    // 设置footer
    self.aCollectionView.mj_footer = footer;
}
- (void)loadData{
    __weak typeof(self) weakSelf = self;

    self.page = 1;
    [self.bookShopRequest loadBookShopWithParameterDic:[self.bookShopRequest getBookShopParametersWithYear:@"2016" andPage:[NSString stringWithFormat:@"%ld",_page] pageCount:@"20"] loadDataSecuessed:^(id result) {
        
        if ([[result objectForKey:@"Code"]  integerValue] == 200) {
            [weakSelf.sourceArray removeAllObjects];
            
            for (NSDictionary *dic  in [[result objectForKey:@"DataList"] objectForKey:@"data"]) {
                CBNBookShopItemModel *bookShopItemModel = [[CBNBookShopItemModel alloc]initWithBookShopItemInfo:dic];
                
                [weakSelf.sourceArray addObject:bookShopItemModel];
                
            }
            [weakSelf.aCollectionView reloadData];

            weakSelf.page++;

        }
        
    } loadDataFailed:^(NSError *error) {
        
    }];
}
- (void)loadMoreBookShopDataFromSever
{
    
    __weak typeof(self) weakSelf = self;
    NSLog(@"self.page -- %ld",(long)self.page);
    [self.bookShopRequest loadBookShopWithParameterDic:[self.bookShopRequest getBookShopParametersWithYear:@"2016" andPage:[NSString stringWithFormat:@"%ld",_page] pageCount:@"20"] loadDataSecuessed:^(id result) {
        NSLog(@"%@",result);
        
        if ([[result objectForKey:@"Code"]  integerValue] == 200) {
            for (NSDictionary *dic  in [[result objectForKey:@"DataList"] objectForKey:@"data"]) {
                CBNBookShopItemModel *bookShopItemModel = [[CBNBookShopItemModel alloc]initWithBookShopItemInfo:dic];
                
                [weakSelf.sourceArray addObject:bookShopItemModel];
                
                
            }
            weakSelf.page++;
            [weakSelf loadMoreFinished];

        }
    } loadDataFailed:^(NSError *error) {
        [weakSelf loadMoreFinished];

    }];

}
- (void)loadMoreFinished
{
    [_aCollectionView reloadData];
    [_aCollectionView.mj_footer endRefreshing];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UICollectionView *)aCollectionView
{
    if (!_aCollectionView) {
        
        CBNBookShopLayout *layout = [[CBNBookShopLayout alloc] init];
        
        self.aCollectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height-64) collectionViewLayout:layout];
        
        _aCollectionView.delegate = self;
        
        _aCollectionView.dataSource = self;
        
        _aCollectionView.dk_backgroundColorPicker = DKColorPickerWithKey(默认背景颜色);

        [self.aCollectionView registerClass:[CBNBookShopItemCell class] forCellWithReuseIdentifier:@"CBNBookShopItemCell"];
        
        
        

    }
    
    return _aCollectionView;
}
- (NSInteger)collectionView:(UICollectionView *)view numberOfItemsInSection:(NSInteger)section;
{
    
    return _sourceArray.count;
}
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath;
{
    
    CBNBookShopItemModel *bookShopItemModel = [_sourceArray objectAtIndex:indexPath.row];
    
    CBNBookShopItemCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CBNBookShopItemCell" forIndexPath:indexPath];
    cell.bookShopItemModel = bookShopItemModel;


    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    CBNBookShopItemModel *bookShopItemModel = [_sourceArray objectAtIndex:indexPath.row];
    CBNBookInfoVC *bookInfoVC = [[CBNBookInfoVC alloc] init];
    
    bookInfoVC.bookItemModel = bookShopItemModel;
    
    [self.navigationController pushViewController:bookInfoVC animated:YES];
}

- (CBNBookShopRequest *)bookShopRequest
{
    if (!_bookShopRequest) {
        
        self.bookShopRequest = [[CBNBookShopRequest alloc] init];
        
        
    }
    
    return _bookShopRequest;
}
- (NSMutableArray *)sourceArray
{
    if (!_sourceArray) {
        
        self.sourceArray = [[NSMutableArray alloc]init];
    }
    
    return _sourceArray;
}
@end
