//
//  CBNArticleHeaderView.h
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/28.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JHCTLabel.h"
#import "CBNChaptAuthorModel.h"
@interface CBNArticleHeaderView : UIView
@property (nonatomic, strong) CBNImageView *newsThumbImageView;
@property (nonatomic, strong) CBNLabel *newsTitleLabel;
@property (nonatomic, strong) CBNLabel *newsNotesLabel;
@property (nonatomic, strong) JHCTLabel *authorLabel;
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIImageView *downArrowImageView;
@property (nonatomic, strong) CBNChaptInfoModel *chapt_Info_Model;
@property (nonatomic, strong) NSArray *author_List;
@end
