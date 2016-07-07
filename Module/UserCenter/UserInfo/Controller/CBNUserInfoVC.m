//
//  CBNUserInfoVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/7.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNUserInfoVC.h"
#import "CBNUserInfoTextCell.h"
#import "CBNUserInfoPhotoCell.h"
#import "CBNUserInfoSwitchCell.h"
#import "CBNUserInfoTextAndArrorsCell.h"

@interface CBNUserInfoVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *aTableView;

@property (nonatomic, strong) NSMutableArray *sourceArray;
@end

@implementation CBNUserInfoVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
   
    
    [self setBackBarButtonItem];
    
    [self setItemTitleWithTitle:@"账号管理"];
    
    [self.view addSubview:self.aTableView];
    
    [self loadData];
}

- (void)loadData
{
    NSArray *arr = [NSArray arrayWithContentsOfFile:[[CBNFileManager sharedInstance] loadPlistFilePathWithPlistName:@"UserInfomation"]];
    
    for (int i = 0; i < arr.count; i++) {
        NSArray *tempSectionArray = [arr objectAtIndex:i];
        NSMutableArray *sectionArray = [[NSMutableArray alloc] init];
        if (i == 0) {
            
            NSDictionary *tempDic = [tempSectionArray objectAtIndex:0];
            NSMutableDictionary *rowDic = [[NSMutableDictionary alloc] init];
            [rowDic setObject:[tempDic objectForKey:@"type"] forKey:@"type"];
            
            NSLog(@"[CBNUser sharedInstance].avatar -- %@",[CBNUser sharedInstance].avatar);
            [rowDic setObject:[CBNUser sharedInstance].avatar forKey:@"photoURL"];
            
            [sectionArray addObject:rowDic];
        }else if (i == 1){
            
            
            for (int j = 0; j < tempSectionArray.count; j++) {
                NSDictionary *tempDic = [tempSectionArray objectAtIndex:j];

                if (j == 0) {
                    NSMutableDictionary *rowDic = [[NSMutableDictionary alloc] init];

                    [rowDic setObject:[tempDic objectForKey:@"type"] forKey:@"type"];
                    [rowDic setObject:[tempDic objectForKey:@"key"] forKey:@"key"];
                    [rowDic setObject:[CBNUser sharedInstance].uemail forKey:@"value"];
                    [sectionArray addObject:rowDic];

                }else if (j == 1){
                    NSMutableDictionary *rowDic = [[NSMutableDictionary alloc] init];
                    
                    [rowDic setObject:[tempDic objectForKey:@"type"] forKey:@"type"];
                    [rowDic setObject:[tempDic objectForKey:@"key"] forKey:@"key"];
                    [rowDic setObject:[CBNUser sharedInstance].nickname forKey:@"value"];
                    [sectionArray addObject:rowDic];

                }else{
                    NSMutableDictionary *rowDic = [[NSMutableDictionary alloc] init];
                    
                    [rowDic setObject:[tempDic objectForKey:@"type"] forKey:@"type"];
                    [rowDic setObject:[tempDic objectForKey:@"key"] forKey:@"key"];
                    [sectionArray addObject:rowDic];
                }
            }
        }else if (i == 2){
            for (int j = 0; j < tempSectionArray.count; j++) {
                NSDictionary *tempDic = [tempSectionArray objectAtIndex:j];
                
                if (j == 0) {
                    NSMutableDictionary *rowDic = [[NSMutableDictionary alloc] init];
                    
                    [rowDic setObject:[tempDic objectForKey:@"type"] forKey:@"type"];
                    [rowDic setObject:[tempDic objectForKey:@"key"] forKey:@"key"];
                    [rowDic setObject:[tempDic objectForKey:@"imageName"] forKey:@"imageName"];
                    
                    [sectionArray addObject:rowDic];
                    
                }else if (j == 1){
                    NSMutableDictionary *rowDic = [[NSMutableDictionary alloc] init];
                    
                    [rowDic setObject:[tempDic objectForKey:@"type"] forKey:@"type"];
                    [rowDic setObject:[tempDic objectForKey:@"key"] forKey:@"key"];
                    [rowDic setObject:[tempDic objectForKey:@"imageName"] forKey:@"imageName"];
                    [sectionArray addObject:rowDic];
                    
                }else{
                    NSMutableDictionary *rowDic = [[NSMutableDictionary alloc] init];
                    [rowDic setObject:[tempDic objectForKey:@"type"] forKey:@"type"];
                    [rowDic setObject:[tempDic objectForKey:@"key"] forKey:@"key"];
                    [rowDic setObject:[tempDic objectForKey:@"imageName"] forKey:@"imageName"];
                    [sectionArray addObject:rowDic];
                }
            }

        }
        
        
        
        
        [self.sourceArray addObject:sectionArray];

    }
    
    [self.aTableView reloadData];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UITableView *)aTableView
{
    if (!_aTableView) {
        
        self.aTableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
        
        _aTableView.delegate = self;
        
        _aTableView.dataSource = self;
        
    }
    
    return _aTableView;
}

#pragma markUITableViewDelegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sourceArray.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [[self.sourceArray objectAtIndex:section] count];
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    NSDictionary *dic = [[self.sourceArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    NSString *type = [dic objectForKey:@"type"];
    
    NSLog(@"type -- %@",type);
    if ([type isEqualToString:@"photo"]) {
        static NSString *str = @"CBNUserInfoPhotoCell";
        
        CBNUserInfoPhotoCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        
        if (cell == nil) {
            
            cell = [[CBNUserInfoPhotoCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            
            
        }
        cell.userInfoDic = dic;
        return cell;

    }else if ([type isEqualToString:@"text"]) {
        static NSString *str = @"CBNUserInfoTextCell";
        
        CBNUserInfoTextCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        
        if (cell == nil) {
            
            cell = [[CBNUserInfoTextCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            
            
        }
        cell.userInfoDic = dic;

        return cell;
        
    }else if ([type isEqualToString:@"arrows"]) {
        static NSString *str = @"CBNUserInfoTextAndArrorsCell";
        
        CBNUserInfoTextAndArrorsCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        
        if (cell == nil) {
            
            cell = [[CBNUserInfoTextAndArrorsCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            
            
        }
        cell.userInfoDic = dic;

        return cell;
        
    }else {
        static NSString *str = @"CBNUserInfoSwitchCell";
        
        CBNUserInfoSwitchCell *cell = [tableView dequeueReusableCellWithIdentifier:str];
        
        if (cell == nil) {
            
            cell = [[CBNUserInfoSwitchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:str];
            
            
        }
        
        cell.userInfoDic = dic;

        return cell;
        
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSDictionary *dic = [[self.sourceArray objectAtIndex:indexPath.section] objectAtIndex:indexPath.row];
    
    NSString *type = [dic objectForKey:@"type"];
    
    NSLog(@"type -- %@",type);
    if ([type isEqualToString:@"photo"]) {
        return 14*screen_Width/320 + 50*screen_Width/320;

    }else{
        return 44*screen_Width/320;
    }
}







- (NSMutableArray *)sourceArray
{
    if (!_sourceArray) {
        
        self.sourceArray = [[NSMutableArray alloc] init];
    }
    
    return _sourceArray;
}



@end
