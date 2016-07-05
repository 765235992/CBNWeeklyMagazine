//
//  CBNDetailBigIamgeVC.m
//  CBNWeeklyMagazine
//
//  Created by Jim on 16/7/5.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "CBNDetailBigIamgeVC.h"
#import "CBNBigImageItemView.h"

@interface CBNDetailBigIamgeVC ()< UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *aScrollView;

@property (nonatomic, assign) NSInteger currentPage;
@end

@implementation CBNDetailBigIamgeVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.navigationController.navigationBarHidden = YES;
    
    [self setClearItemTitle];
    [self.view addSubview:self.aScrollView];
    
    self.currentPage = 0;
    CGFloat width = self.view.frame.size.width;
    
    //    for (int i = 0; i < 1; i++) {
    
    CBNBigImageItemView *photoView = [[CBNBigImageItemView alloc] initWithFrame:CGRectMake((5), -20, width-10, _aScrollView.frame.size.height) andImage:[UIImage imageNamed:@"defaultImage.jpg"]];
    
    photoView.autoresizingMask = (1 << 6) -1;
    
    photoView.tag = 100 + 0;
    photoView.imageURL = _chaptBlockModel.blockImageContent.imageURL;
    
    [_aScrollView addSubview:photoView];

    
    [photoView gesturesResultsOneClcked:^(CBNBigImageItemView *imageCell) {
        
        //NSLog(@"单机 %@",imageCell);
        
        [self back];
        
        
    } longPress:^(CBNBigImageItemView *imageCell) {
        
        //NSLog(@"长按 %@",imageCell);
        
        //保存到相机
        //            UIImageWriteToSavedPhotosAlbum( [UIImage imageNamed:@"test.jpg"], self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
        
    }];

}
- (void)back{
    self.navigationController.navigationBarHidden = NO;

    [self.navigationController popViewControllerAnimated:YES];
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UIScrollView *)aScrollView
{
    
    if (!_aScrollView) {
        
        self.aScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 20, screen_Width, screen_Height-20)];
        
        _aScrollView.backgroundColor = [UIColor blackColor];
        
        _aScrollView.pagingEnabled = YES;
        
        _aScrollView.delegate = self;
    }
    
    return _aScrollView;
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    
    NSInteger count =(_aScrollView.frame.size.width*0.5+_aScrollView.contentOffset.x)/_aScrollView.frame.size.width;
    
    if (count != _currentPage) {
        
        CBNBigImageItemView *cell = [_aScrollView viewWithTag:100+ _currentPage ];
        
        [cell restoreImage];
        
        _currentPage = count;
        
        
    }
}

@end
