//
//  CBNDrawerVisualStateManager.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/6/30.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNDrawerVisualStateManager.h"
#import <QuartzCore/QuartzCore.h>

@implementation CBNDrawerVisualStateManager

+ (CBNDrawerVisualStateManager *)sharedManager {
    static CBNDrawerVisualStateManager *_sharedManager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedManager = [[CBNDrawerVisualStateManager alloc] init];
        [_sharedManager setLeftDrawerAnimationType:MMDrawerAnimationTypeParallax];
        [_sharedManager setRightDrawerAnimationType:MMDrawerAnimationTypeParallax];
    });
    
    return _sharedManager;
}

-(MMDrawerControllerDrawerVisualStateBlock)drawerVisualStateBlockForDrawerSide:(MMDrawerSide)drawerSide{
    MMDrawerAnimationType animationType;
    if(drawerSide == MMDrawerSideLeft){
        animationType = self.leftDrawerAnimationType;
    }
    else {
        animationType = self.rightDrawerAnimationType;
    }
    
    MMDrawerControllerDrawerVisualStateBlock visualStateBlock = nil;
    switch (animationType) {
        case MMDrawerAnimationTypeSlide:
            visualStateBlock = [MMDrawerVisualState slideVisualStateBlock];
            break;
        case MMDrawerAnimationTypeSlideAndScale:
            visualStateBlock = [MMDrawerVisualState slideAndScaleVisualStateBlock];
            break;
        case MMDrawerAnimationTypeParallax:
            visualStateBlock = [MMDrawerVisualState parallaxVisualStateBlockWithParallaxFactor:2.0];
            break;
        case MMDrawerAnimationTypeSwingingDoor:
            visualStateBlock = [MMDrawerVisualState swingingDoorVisualStateBlock];
            break;
        default:
            visualStateBlock =  ^(MMDrawerController * drawerController, MMDrawerSide drawerSide, CGFloat percentVisible){
                
                UIViewController * sideDrawerViewController;
                CATransform3D transform;
                CGFloat maxDrawerWidth;
                
                if(drawerSide == MMDrawerSideLeft){
                    sideDrawerViewController = drawerController.leftDrawerViewController;
                    maxDrawerWidth = drawerController.maximumLeftDrawerWidth;
                }
                else if(drawerSide == MMDrawerSideRight){
                    sideDrawerViewController = drawerController.rightDrawerViewController;
                    maxDrawerWidth = drawerController.maximumRightDrawerWidth;
                }
                
                if(percentVisible > 1.0){
                    transform = CATransform3DMakeScale(percentVisible, 1.f, 1.f);
                    
                    if(drawerSide == MMDrawerSideLeft){
                        transform = CATransform3DTranslate(transform, maxDrawerWidth*(percentVisible-1.f)/2, 0.f, 0.f);
                    }else if(drawerSide == MMDrawerSideRight){
                        transform = CATransform3DTranslate(transform, -maxDrawerWidth*(percentVisible-1.f)/2, 0.f, 0.f);
                    }
                }
                else {
                    transform = CATransform3DIdentity;
                }
                [sideDrawerViewController.view.layer setTransform:transform];
            };
            break;
    }
    return visualStateBlock;
}

@end