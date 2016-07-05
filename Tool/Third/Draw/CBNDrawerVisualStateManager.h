//
//  CBNDrawerVisualStateManager.h
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MMDrawerVisualState.h"
typedef NS_ENUM(NSInteger, MMDrawerAnimationType){
    MMDrawerAnimationTypeNone,
    MMDrawerAnimationTypeSlide,
    MMDrawerAnimationTypeSlideAndScale,
    MMDrawerAnimationTypeSwingingDoor,
    MMDrawerAnimationTypeParallax,
};
@interface CBNDrawerVisualStateManager : NSObject
@property (nonatomic,assign) MMDrawerAnimationType leftDrawerAnimationType;
@property (nonatomic,assign) MMDrawerAnimationType rightDrawerAnimationType;

+ (CBNDrawerVisualStateManager *)sharedManager;

-(MMDrawerControllerDrawerVisualStateBlock)drawerVisualStateBlockForDrawerSide:(MMDrawerSide)drawerSide;

@end