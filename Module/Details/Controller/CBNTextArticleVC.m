//
//  CBNTextArticleVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNTextArticleVC.h"
#import "CBNArticleHeaderView.h"
#import "CBNbookmarksView.h"
#import "CBNRecommendedAndCollectionAndShareView.h"
#import "CBNRelatedNewsView.h"
#import "CBNADBannerCell.h"
#import "CBNRelatedNewsCell.h"
#import "CBNBookMarsksCell.h"
#import "CBNRecommendCollectionAndShareCell.h"
#import "CBNChaptInfoModel.h"
#import "CBNChaptAuthorModel.h"
#import "CBNArticleModel.h"
#import "CBNChaptBlockModel.h"
#import "CBNChaptBlockImageModel.h"
#import "CBNChaptSubTitleCell.h"
#import "CBNChaptImageCell.h"
#import "CBNChaptBlockCell.h"
#import "CBNDetailBigIamgeVC.h"
#import "CBNArticleFootView.h"
#import "CBNTextNewsDetailRequest.h"

@interface CBNTextArticleVC ()<UITableViewDataSource, UITableViewDelegate,CBNArticleFootViewDelegate,UIActionSheetDelegate>
@property (nonatomic, strong) NSMutableArray *sourceArray;
@property (nonatomic, strong) UITableView *aTableView;
@property (nonatomic, strong) CBNArticleModel *articleModel;
@property (nonatomic, strong) CBNArticleHeaderView *headerView;
@property (nonatomic, strong) UIView *footView;
@property (nonatomic, strong) CBNArticleFootView *articleFootView;
@end

@implementation CBNTextArticleVC
- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    self.navigationController.navigationBar.translucent= NO;
    self.navigationController.navigationBar.dk_barTintColorPicker = DKColorPickerWithColors([UIColor whiteColor],RGBColor(3, 3, 3, 0.6),[UIColor orangeColor]);
    [self.navigationController.navigationBar setBackgroundImage:[[UIColor clearColor] colorImage] forBarMetrics:UIBarMetricsDefault];
}
- (void)dealloc
{
    NSLog(@"释放了");
}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setBarButtonItems];
    
    self.sourceArray = [[NSMutableArray alloc] init];
    
    [self.view addSubview:self.aTableView];
    
    [self.view addSubview:self.articleFootView];
    [self loadData];
    
    
   
}

#define mark loadData
- (void)loadData
{
    //2是期刊，1是日更
    if ([self.daymore integerValue] == 2) {
        
        [CBNTextNewsDetailRequest GET:[CBNTextNewsDetailRequest getNormalTextNewsDetailURL] parameters:[CBNTextNewsDetailRequest getNormalTextNewsDetailParametersWithChapt_ID:self.chapt_ID issue_ID:self.issue_ID] success:^(id result) {
            
            if ([[result objectForKey:@"Code"] integerValue] == 200) {
                
                [self dayMoreText:result];
            }else{
                
//                UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:[result objectForKey:@"Error"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
//                
//                [alter show];
                
            }

        } failed:^(NSError *error) {
            NSLog(@"%@",error);
        }];
    }else{
        [CBNTextNewsDetailRequest GET:[CBNTextNewsDetailRequest getDaymoreTextNewsDetailURL] parameters:[CBNTextNewsDetailRequest getDaymoreTextNewsDetailParametersWithChapt_ID:self.chapt_ID issue_ID:self.issue_ID] success:^(id result) {
            
            if ([[result objectForKey:@"Code"] integerValue] == 200) {
                
                [self dayMoreText:result];
            }else{
                
//                UIAlertView *alter = [[UIAlertView alloc] initWithTitle:@"提示" message:[result objectForKey:@"Error"] delegate:self cancelButtonTitle:@"取消" otherButtonTitles:nil, nil];
//                
//                [alter show];
                
            }
            
        } failed:^(NSError *error) {
            NSLog(@"%@",error);
        }];

    }
}
- (void)dayMoreText:(id) result
{
    self.articleModel = [[CBNArticleModel alloc] initArticleResult:[result objectForKey:@"DataList"]];
    
    self.headerView.chapt_Info_Model = _articleModel.chapt_info;
    
    _headerView.author_List = _articleModel.author_list;
    
    [_aTableView setTableHeaderView:self.headerView];
    [_aTableView setTableFooterView:self.footView];
    [_sourceArray insertObject:_articleModel.block_list atIndex:0];
    NSMutableArray *bottomArray = [[NSMutableArray alloc] init];
    
    [bottomArray addObject:@"like_Collection_Share"];
    [bottomArray addObject:@"related_Book_Mask"];
    [bottomArray addObject:@"banner"];
    if (_articleModel.related_news_list.count > 0) {
        
        [bottomArray addObject:@"related_news"];
        
    }
    [_sourceArray addObject:bottomArray];
    [_aTableView reloadData];

    

}
//- (void)issueText:(id) result
//{
//    self.articleModel = [[CBNArticleModel alloc] initArticleResult:[result objectForKey:@"DataList"]];
//    
//    self.headerView.chapt_Info_Model = _articleModel.chapt_info;
//    
//    _headerView.author_List = _articleModel.author_list;
//    
//    dispatch_async(dispatch_get_main_queue(), ^{
//        
//        [_aTableView setTableHeaderView:self.headerView];
//        [_aTableView setTableFooterView:self.footView];
//        [_sourceArray insertObject:_articleModel.block_list atIndex:0];
//        NSMutableArray *bottomArray = [[NSMutableArray alloc] init];
//        
//        [bottomArray addObject:@"like_Collection_Share"];
//        [bottomArray addObject:@"related_Book_Mask"];
//        [bottomArray addObject:@"banner"];
//        [bottomArray addObject:@"related_news"];
//        [_sourceArray addObject:bottomArray];
//        [_aTableView reloadData];
//    });
//    
//    
//}
#pragma mark 创建tableView
- (UITableView *)aTableView
{
    if (!_aTableView) {
        
        self.aTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, screen_Height-64)];
        
        _aTableView.delegate = self;
        
        _aTableView.dataSource = self;
        
        _aTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        _aTableView.dk_backgroundColorPicker =  DKColorPickerWithKey(默认背景颜色);
    }
    
    return _aTableView;
}

#define markCBNArticleHeaderView1
- (CBNArticleHeaderView *)headerView
{
    if (!_headerView) {
        self.headerView = [[CBNArticleHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 0)];
    }
    return _headerView;
}
#define markfootView
- (UIView *)footView
{
    if (!_footView) {
        
        self.footView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, screen_Width, 100*screen_Width/320)];
        
        _footView.backgroundColor = [UIColor clearColor];
    }
    
    return _footView;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _sourceArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[_sourceArray objectAtIndex:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.section == 0) {
        CBNChaptBlockModel *chaptBlockModel = [_articleModel.block_list objectAtIndex:indexPath.row];
        
        
        if ([chaptBlockModel.blockType isEqualToString:@"text"]) {
            
            static NSString *identifier = @"ChaptBlockCell";
            
            CBNChaptBlockCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (cell == nil) {
                
                cell = [[CBNChaptBlockCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                
                __weak typeof(self) weakSelf = self;
                
                [cell.blockTextView CBNChaptKeyWordClicked:^(NSDictionary *keyWordInfo) {
                    //                [weakSelf keyWordClicked:keyWordInfo];
                    
                } copyAction:^(NSDictionary *copyInfo) {
                    
                } readPressedAction:^(NSDictionary *readPressedInfo) {
                    
                } cancleReadPressedAction:^(NSDictionary *cancleReadPressedInfo) {
                    
                }];
            }
            cell.chaptBlockModel = chaptBlockModel;
            
            chaptBlockModel = cell.chaptBlockModel;
            
            [_articleModel.block_list replaceObjectAtIndex:indexPath.row withObject:chaptBlockModel];
            
            [cell setNeedsDisplay];
            
            return cell;
            
        }else if ([chaptBlockModel.blockType isEqualToString:@"subtitle"]){
            
            static NSString *identifier = @"CBNChaptSubTitleCell";
            
            
            CBNChaptSubTitleCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (cell == nil) {
                
                cell = [[CBNChaptSubTitleCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                
                __weak typeof(self) weakSelf = self;
                
                [cell.blockTextView CBNChaptKeyWordClicked:^(NSDictionary *keyWordInfo) {
                    //                [weakSelf keyWordClicked:keyWordInfo];
                    
                } copyAction:^(NSDictionary *copyInfo) {
                    
                } readPressedAction:^(NSDictionary *readPressedInfo) {
                    
                } cancleReadPressedAction:^(NSDictionary *cancleReadPressedInfo) {
                    
                }];
                
            }
            
            cell.chaptBlockModel = chaptBlockModel;
            
            chaptBlockModel = cell.chaptBlockModel;
            
            [_articleModel.block_list replaceObjectAtIndex:indexPath.row withObject:chaptBlockModel];
            
            return cell;
            
        }else{
            
            static NSString *identifier = @"CBNChaptImageCell";
            
            CBNChaptImageCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            
            if (cell == nil) {
                
                cell = [[CBNChaptImageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                
            }
            
            cell.chaptBlockModel = chaptBlockModel;
            
            chaptBlockModel = cell.chaptBlockModel ;
            
            [_articleModel.block_list replaceObjectAtIndex:indexPath.row withObject:chaptBlockModel];
            
            return cell;
            
        }

    }
    
    NSString *type = [[_sourceArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    if ([type isEqualToString:@"like_Collection_Share"]) {
        CBNRecommendCollectionAndShareCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBNRecommendCollectionAndShareCell"];
        if (cell == nil) {
            cell = [[CBNRecommendCollectionAndShareCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CBNRecommendCollectionAndShareCell"];
            
        }

        return cell;
    }else if ([type isEqualToString:@"related_Book_Mask"]) {
        CBNBookMarsksCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBNBookMarsksCell"];
        if (cell == nil) {
            cell = [[CBNBookMarsksCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CBNBookMarsksCell"];
            
        }
        return cell;
    }else if ([type isEqualToString:@"banner"]) {
        
        CBNADBannerCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBNADBannerCell"];
        
        if (cell == nil) {
            cell = [[CBNADBannerCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CBNADBannerCell"];
            
        }
        return cell;
    }else{
        CBNRelatedNewsCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CBNRelatedNewsCell"];
        if (cell == nil) {
            
            cell = [[CBNRelatedNewsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CBNRelatedNewsCell"];
            
        }
        return cell;
    }
    
    
    return nil;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CBNChaptBlockModel *chaptBlockModel = [_articleModel.block_list objectAtIndex:indexPath.row];
        
        if (chaptBlockModel.height == 0.0) {
            
            return 1000;
            
        }
        return chaptBlockModel.height;

    }
    NSString *type = [[_sourceArray objectAtIndex:1] objectAtIndex:indexPath.row];
    
    if ([type isEqualToString:@"like_Collection_Share"]) {

        return screen_Width*0.12*2 + 17*screen_Width/320;
    }else if ([type isEqualToString:@"related_Book_Mask"]){
        
        return screen_Width*0.12*2 ;
        
    }else if ([type isEqualToString:@"banner"]){
        
        return screen_Width*0.348;
        
    }else{
        return screen_Width * 0.37*0.555 + 30;
    }
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        CBNChaptBlockModel *chaptBlockModel = [_articleModel.block_list objectAtIndex:indexPath.row];
        if ([chaptBlockModel.blockType isEqualToString:@"image"]) {
            CBNDetailBigIamgeVC *detailBigImageVC = [[CBNDetailBigIamgeVC alloc] init];
            detailBigImageVC.chaptBlockModel = chaptBlockModel;
            [self.navigationController pushViewController:detailBigImageVC animated:YES];
        }
        
    }
}

- (CBNArticleFootView *)articleFootView
{
    if (!_articleFootView) {
        
        self.articleFootView = [[CBNArticleFootView alloc] initWithFrame:CGRectMake(0, screen_Height- 64-44, screen_Width, 44)];
        
        _articleFootView.delegate = self;
        
//        _articleFootView.backgroundColor = [UIColor redColor];
    }
    
    return _articleFootView;
}
- (void)commentsButtonClicked:(UIButton *)sender
{
    
}
- (void)commentsCollectionAndShareButtonClicked:(CBNArticleFootViewType)type
{
    NSLog(@"%ld",(long)type);
    
    UIActionSheet *sheet = [[UIActionSheet alloc] initWithTitle:@"分享" delegate:self cancelButtonTitle:@"取消" destructiveButtonTitle:@"QQ" otherButtonTitles:@"Sina",@"weixin", nil];
    [sheet showInView:self.view];
}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    if (buttonIndex == 0) {
        //QQ
        
        [[CBNUMShareManager sharedInstance] shareToThePlate:CBNQQPlate title:@"愤怒的小鸟" content:@"愤怒的小鸟" image:[UIImage imageNamed:@"defaultImage.jpg"] andUrl:@"http:www.baidu.com"];
    }else if (buttonIndex == 1){
        [[CBNUMShareManager sharedInstance] shareToThePlate:CBNSinaPlate title:@"愤怒的小鸟" content:@"愤怒的小鸟" image:[UIImage imageNamed:@"defaultImage.jpg"] andUrl:@"http:www.baidu.com"];
            //sina
    }else if (buttonIndex == 2){
        [[CBNUMShareManager sharedInstance] shareToThePlate:CBNWechatSessionPlate title:@"愤怒的小鸟" content:@"愤怒的小鸟" image:[UIImage imageNamed:@"defaultImage.jpg"] andUrl:@"http:www.baidu.com"];

        //weixin
    }
}

@end