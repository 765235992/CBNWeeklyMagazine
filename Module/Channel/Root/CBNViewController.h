//
//  CBNViewController.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNBaseViewController.h"
#import "CBNTextArticleVC.h"
//@property (nonatomic, strong) NSString *chapt_ID;
//@property (nonatomic, strong) NSString *issue_ID;
//@property (nonatomic, strong) NSString *DataType;
//@property (nonatomic, strong) NSString *daymore;
@interface CBNViewController : CBNBaseViewController
- (UIImage *)screenImage;
- (void)goToTextArticleVCWithChapt_ID:(NSString *)chapt_ID issue_ID:(NSString *)issue_ID DataType:(NSString *)DataType daymore:(NSString *)daymore;
@end
