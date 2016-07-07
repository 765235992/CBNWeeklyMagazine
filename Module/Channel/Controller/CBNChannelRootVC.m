//
//  CBNChannelRootVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNChannelRootVC.h"
#import "JHScrollPageView.h"
#import "JHSegmentStyle.h"
#import "CBNTextArticleVC.h"
#import "CBNLogoView.h"
#import "CBNBarBurronItem.h"
#import "CBNUserCenterView.h"
#import "CBNFuzzyImageView.h"
#import "CBNBookShopDrawView.h"
#import "CBNHomePageVC.h"
#import "CBNChannelColumnRequest.h"
#import "CBNPublicChannelVC.h"



#define 用户控制中心
#import "CBNSearchVC.h"
#import "CBNCollectionVC.h"
#import "CBNExcerptVC.h"
#import "CBNDownIssueVC.h"
#import "CBNSubscriptionVC.h"
#import "CBNSetterVC.h"
#import "CBNLoginVC.h"
#import "CBNUserInfoVC.h"
#import "CBNBookShopVC.h"
#import "CBNBookInfoVC.h"

#define draw_Back_Alpha  0.8
#define user_Center_Open  0.48
#define fuzzy 2
@interface CBNChannelRootVC ()<CBNFuzzyImageViewDelegate,CBNLogoViewDelegate,CBNUserCenterViewDelegate>
{
    JHScrollPageView *scrollPageView;
    BOOL isClicked;
}

@property (nonatomic, strong) UITableView *aTableView;
@property (nonatomic, strong) CBNFuzzyImageView *fuzzyImageView;
@property (nonatomic, strong) CBNBookShopDrawView *bookShopDrawView;
@property (nonatomic, strong) CBNLogoView *logoView;
@property (nonatomic, strong) NSMutableArray *currentArr;

@end

@implementation CBNChannelRootVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent= YES;

}
- (void)viewDidLoad {
    
    [super viewDidLoad];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(userCenterItemClicked:) name:@"userCenterItemClicked" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToLoginOrUserInfomation:) name:@"goToLoginOrUserInfomation" object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(goToSearchVC:) name:@"goToSearchVC" object:nil];

    
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithColors([UIColor clearColor],[UIColor clearColor],[UIColor orangeColor]);
    
    
    
    [self loadChannelColumnDataFromSever];
    
    [self addChannelChangeView];

    [self setNavigationHeader];

    [self.view addSubview:self.logoView];
//
    [self.view addSubview:self.fuzzyImageView];
//
    [self.view addSubview:self.bookShopDrawView];
    
}


#define mark 请求频道列表
- (void)loadChannelColumnDataFromSever
{

    [CBNChannelColumnRequest GET:[CBNChannelColumnRequest getChannelColumnURL] parameters:[CBNChannelColumnRequest getChannelColumnParameters] success:^(id result) {
        NSLog(@"%@",result);

        if ([[result objectForKey:@"Code"] integerValue] == 200) {
            /*
             *  获取本地缓存的频道列表
             */
            NSDictionary *allChannelColumnDic = [NSDictionary dictionaryWithDictionary:[[CBNFileManager sharedInstance] loadBasicDataTypesWithKey:channel_List_Key]];
            if ([[NSString stringWithFormat:@"%@",[allChannelColumnDic objectForKey:@"Updatetime"]] isEqualToString:[NSString stringWithFormat:@"%@",[result objectForKey:@"Updatetime"]]]) {
                /*
                 *  无更新不操作
                 */
                NSLog(@"无更新不操作");
            }else{
                
                NSLog(@"有更新要操作");

                [[CBNFileManager sharedInstance] saveBasicDataTypes:result withKey:channel_List_Key];
 
            }
            
            
        }
    } failed:^(NSError *error) {
        NSLog(@"%@",error);

    }];
}
/*
 *  添加频道切换视图
 */
- (void)addChannelChangeView
{

    
    //必要的设置, 如果没有设置可能导致内容显示不正常
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    JHSegmentStyle *style = [[JHSegmentStyle alloc] init];
    style.showLine = YES;
    
//    style.segmentHeight = segmentView_Height;
    style.titleFont = font_px_Regular(fontSize(38.0,36.0,36.0));
    style.scrollLineHeight = 3;

    // 设置子控制器 --- 注意子控制器需要设置title, 将用于对应的tag显示title
    NSArray *childVcs = [NSArray arrayWithArray:[self setupChildVcAndTitle]];
    
    self.currentArr = [[NSMutableArray alloc] initWithArray:childVcs];
    // 初始化
    scrollPageView = [[JHScrollPageView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height) segmentStyle:style childVcs:childVcs parentViewController:self];

    scrollPageView.currentTitleInfo = ^(UILabel *label, NSInteger index){
        
        NSLog(@"%@",label.text);
    };
    
    
    [self.view addSubview:scrollPageView];
    
}
- (void)day{
    isClicked = YES;
    
    [self.dk_manager dawnComing];
    
}
- (void)night{
    isClicked = NO;
    [self.dk_manager nightFalling];
    
}
- (NSArray *)setupChildVcAndTitle {
    
    NSMutableArray *channelVCArray = [[NSMutableArray alloc] init];
    
    CBNHomePageVC *recommendedVC = [[CBNHomePageVC alloc] init];
    
    recommendedVC.title = @"推荐";
    [channelVCArray addObject:recommendedVC];
    
    NSDictionary *allChannelColumnDic = [NSDictionary dictionaryWithDictionary:[[CBNFileManager sharedInstance] loadBasicDataTypesWithKey:channel_List_Key]];
    
    if (allChannelColumnDic.count > 0) {
        for ( NSDictionary *channelItem in [allChannelColumnDic objectForKey:@"DataList"]) {
            
            [channelVCArray addObject:[self addChannelColumVCWithChannnelDic:channelItem]];
        }
    }
    return channelVCArray;

}
- (id)addChannelColumVCWithChannnelDic:(NSDictionary *)channelDic
{

    CBNPublicChannelVC *publicVC = [[CBNPublicChannelVC alloc] init];
    CBNChannelColumnModel *publicModel = [[CBNChannelColumnModel alloc] initWithChannelColumnInfo:channelDic];
    
    publicVC.channelColumnModel = publicModel;
    publicVC.title = [channelDic objectForKey:@"name"];
    
    return publicVC;

}



#pragma mark setNavigationHeader

- (void)setNavigationHeader
{
    CBNBarBurronItem *leftBar = [[CBNBarBurronItem alloc] initWithTarget:self action:@selector(leftBar:) andFrame:CGRectMake(0, 0, 44, 44) andImage:[RGBColor(0, 0, 0, 1) colorImage]];
    
    CBNBarBurronItem *rightBar = [[CBNBarBurronItem alloc] initWithTarget:self action:@selector(rightBar:) andFrame:CGRectMake(0, 0, 44, 44) andImage:[RGBColor(0, 0, 0, 0) colorImage]];
    
    self.navigationItem.leftBarButtonItem = leftBar;
    
    self.navigationItem.rightBarButtonItem= rightBar;
    
}
/*
 *  抽屉打开
 */
-(void)leftBar:(id)sender
{

    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}
/*
 *  前往设置
 */
-(void)rightBar:(id)sender
{
    
    [self bookShopDrawViewOpen];
    
//    CBNTextArticleVC *ar = [[CBNTextArticleVC alloc] init];
//    
//    [self.navigationController pushViewController:ar animated:YES];
    
}

#pragma mark fuzzyImageView
- (CBNFuzzyImageView *)fuzzyImageView
{
    if (!_fuzzyImageView) {
        
        self.fuzzyImageView = [[CBNFuzzyImageView alloc] initWithFrame:self.view.bounds];
        
        _fuzzyImageView.delegate = self;
        
        _fuzzyImageView.hidden = YES;
    }
    
    return _fuzzyImageView;
}
- (void)cleanFuzzyImageView
{
    
    _fuzzyImageView.image = nil;
    
    _fuzzyImageView.hidden = YES;
    
    self.navigationController.navigationBarHidden = NO;
    
    [self bookShopDrawViewClosed];
    
}

#define 左侧用户中心抽屉通知



- (void)goToLoginOrUserInfomation:(id)sender
{
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        
    }];
//    CBNLoginVC *loginVC = [[CBNLoginVC alloc] init];
//    
//    [self.navigationController pushViewController:loginVC animated:YES];
    CBNUserInfoVC *userInfoVC = [[CBNUserInfoVC alloc] init];
    
    [self.navigationController pushViewController:userInfoVC animated:YES];
    
}
- (void)goToSearchVC:(id)sender
{
    
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        
    }];
    CBNSearchVC *searchVC = [[CBNSearchVC alloc] init];
    
    [self.navigationController pushViewController:searchVC animated:YES];
}
- (void)userCenterItemClicked:(NSNotification *)userInfo
{
    
    NSDictionary *dic = userInfo.userInfo;
    
    NSIndexPath *indexPath = [dic objectForKey:@"tableViewClicked"];
    [self.mm_drawerController closeDrawerAnimated:YES completion:^(BOOL finished) {
        
    }];
    switch (indexPath.row) {
        case 0:
            [self goToCollectionVC];
            break;
        case 1:
            [self goToExcerptVC];
            break;
        case 2:
            [self goToDownIssueVC];
            break;
        case 3:
            [self goToSubscriptionVC];
            break;
        case 4:
            [self goToSetterVC];
            break;
            
        default:
            break;
    }
}
- (void)goToCollectionVC
{
    
    CBNCollectionVC *collectionVC= [[CBNCollectionVC alloc] init];
    
    [self.navigationController pushViewController:collectionVC animated:YES];

}
- (void)goToExcerptVC
{
    CBNExcerptVC *excerptVC = [[CBNExcerptVC alloc] init];
    
    [self.navigationController pushViewController:excerptVC animated:YES];
}
- (void)goToDownIssueVC
{
    CBNDownIssueVC *downIssueVC = [[CBNDownIssueVC alloc] init];
    
    [self.navigationController pushViewController:downIssueVC animated:YES];
    
}
- (void)goToSubscriptionVC
{
    CBNSubscriptionVC *subscriptionVC = [[CBNSubscriptionVC alloc] init];
    
    [self.navigationController pushViewController:subscriptionVC animated:YES];
}
- (void)goToSetterVC
{
    CBNSetterVC *setterVC = [[CBNSetterVC alloc] init];
    [self.navigationController pushViewController:setterVC animated:YES];
}
#pragma mark bookShopDrawView
- (CBNBookShopDrawView *)bookShopDrawView
{
    if (!_bookShopDrawView) {
        
        self.bookShopDrawView = [[CBNBookShopDrawView alloc] initWithFrame:CGRectMake(0,0, screen_Width, book_Shop_Open)];
        
        _bookShopDrawView.backgroundColor = [UIColor colorWithRed:3/255.0 green:3/255.0 blue:3/255.0 alpha:draw_Back_Alpha];
        
        _bookShopDrawView.center = CGPointMake(screen_Width/2, -book_Shop_Open/2 - 5);
        
        __weak typeof(self) weakSelf = self;
        
        _bookShopDrawView.bookShopGoToIssueInfo = ^(NSInteger index){

            [weakSelf goToIssuedInfo:index];
            
        };
        
        _bookShopDrawView.bookShop = ^(UIButton *sender){
            
            [weakSelf goToBookShop:sender];

        };
    }
    return _bookShopDrawView;
}
-(void)goToIssuedInfo:(NSInteger)index
{
    NSLog(@"期刊详情");
    CBNBookInfoVC *bookInfoVC = [[CBNBookInfoVC alloc] init];
    
    [self.navigationController pushViewController:bookInfoVC animated:YES];
    
    [UIView animateWithDuration:2 animations:^{
        
    } completion:^(BOOL finished) {
        [self cleanFuzzyImageView];
        
    }];
}
-(void)goToBookShop:(UIButton *)sender
{
    NSLog(@"书店列表");
    CBNBookShopVC *bookShopVC = [[CBNBookShopVC alloc] init];
    
    [self.navigationController pushViewController:bookShopVC animated:YES];
    
    [UIView animateWithDuration:2 animations:^{
        
    } completion:^(BOOL finished) {
        [self cleanFuzzyImageView];
        
    }];
  
}
- (void)bookShopDrawViewOpen
{
    self.navigationController.navigationBarHidden = YES;

    _fuzzyImageView.hidden = NO;
    
    self.fuzzyImageView.image = [[self screenImage] blurImageWithRadius:fuzzy];
    [UIView animateWithDuration:0.35 animations:^{
        _bookShopDrawView.frame = CGRectMake(0, 0, screen_Width, book_Shop_Open);
        
    }];
    
}
- (void)bookShopDrawViewClosed
{
    [UIView animateWithDuration:0.35 animations:^{
        
        _bookShopDrawView.frame = CGRectMake(0, -book_Shop_Open, screen_Width, book_Shop_Open);
        
    }];
    
    _bookShopDrawView.center = CGPointMake(screen_Width/2, -book_Shop_Open/2 -5);

    
}
#pragma mark logoView
- (CBNLogoView *)logoView
{
    
    if (!_logoView) {
        
        self.logoView = [[CBNLogoView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 64)];
        
    }
    
    return _logoView;
}



@end
