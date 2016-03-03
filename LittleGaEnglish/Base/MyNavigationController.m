//
//  MyNavigationController.m
//  usedCar
//
//  Created by Lirui on 14/9/29.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import "MyNavigationController.h"
#import "SDImageCache.h"
#import <QuartzCore/QuartzCore.h>
#import <objc/runtime.h>
#import "Masonry.h"

static const CGFloat kAnimationDuration = 0.5f;


@interface MyNavigationController ()<UIGestureRecognizerDelegate>{

    CGFloat _changePanX;
    UIImageView * _panBgView;
}
//所有导航上的viewcontrollers
//@property (nonatomic,strong)NSMutableArray * panViewControllers;

@end

@implementation MyNavigationController

- (void)setNav{
    if (kSYSTEMNAME_AND_VERSION >= 7.0){
        self.navigationController.navigationBar.barTintColor = [UIColor customColorWithString:k_Color_navigation];
        [[UINavigationBar appearance]setBarTintColor:[UIColor customColorWithString:k_Color_navigation]];
    }else{
        self.navigationController.navigationBar.tintColor = [UIColor customColorWithString:k_Color_navigation];
        [[UINavigationBar appearance]setTintColor:[UIColor customColorWithString:k_Color_navigation]];
    }
    self.navigationController.navigationBar.backgroundColor = [UIColor customColorWithString:k_Color_navigation];
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc]init]];
    self.navigationController.navigationBar.alpha = 1;
    self.navigationController.navigationBar.translucent = NO;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNav];
    self.needHandlePanGestureRecognizer = YES;
    self.view.backgroundColor = [UIColor customColorWithString:k_Color_f4f4f6];
//    self.hidesBottomBarWhenPushed = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    [[SDImageCache sharedImageCache]clearMemory];
}

#pragma mark - 控制APP方向
//-(BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
//    return [self.topViewController
//            shouldAutorotateToInterfaceOrientation:interfaceOrientation];
//}

//- (BOOL)shouldAutorotate {
//    return self.topViewController.shouldAutorotate;
//}
//-(NSUInteger)supportedInterfaceOrientations {
//    return [self.topViewController supportedInterfaceOrientations];
//}
//
//-(UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
//    return [self.topViewController preferredInterfaceOrientationForPresentation];
//}


#pragma mark - 添加导航中vc

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
    
//    if (!self.panViewControllers) {
//        self.panViewControllers = [NSMutableArray array];
//    }
//    [self.panViewControllers addObject:viewController];
    
    if (self.viewControllers.count>1) {
        [self addPanGestureToView:viewController];
    }
}

#pragma mark - 控制手势

- (UIViewController *)currentViewController {
    UIViewController *result = nil;
    if ([self.viewControllers count]>0) {
        result = [self.viewControllers lastObject];
    }
    return result;
}

- (UIViewController *)previousViewController {
    UIViewController *result = nil;
    if ([self.viewControllers count]>1) {
        result = [self.viewControllers objectAtIndex:self.viewControllers.count - 2];
    }
    return result;
}

- (UIViewController *)rootViewController{
    UIViewController * result = nil;
    if ([self.viewControllers count]>0) {
        result = [self.viewControllers firstObject];
    }
    return result;
}

- (void) addPanGestureToView:(UIViewController * )panResponderVC
{
    UIPanGestureRecognizer* panGesture = [[UIPanGestureRecognizer alloc] initWithTarget:self
                                                                                 action:@selector(gestureRecognizerDidPan:)];
    panGesture.cancelsTouchesInView = YES;
    panGesture.delegate = self;
    [panResponderVC.view addGestureRecognizer:panGesture];
    panGesture = nil;
    
    [self panBgView];
}

- (void)panBgView{
    if (_panBgView) {
        return;
    }
    _panBgView = [[UIImageView alloc]initWithFrame:CGRectMake(-66, (kSYSTEM_SCREEN_HEIGHT -60)/2.0, 66, 60)];
    [self.view addSubview:_panBgView];
    _panBgView.backgroundColor = [UIColor colorWithPatternImage:[UIImage imageNamed:@"alert_bg"]];
    self.view.clipsToBounds = YES;
    _panBgView.clipsToBounds = YES;
    _panBgView.layer.cornerRadius = 3;
    
    UIImageView * centerImv = [UIImageView new];
    centerImv.backgroundColor = [UIColor clearColor];
    [_panBgView addSubview:centerImv];
    centerImv.contentMode = UIViewContentModeScaleAspectFit;
    centerImv.image = [UIImage imageNamed:@"big_white_back"];
    [centerImv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@16);
        make.height.equalTo(@29);
        make.centerX.equalTo(_panBgView.mas_centerX);
        make.centerY.equalTo(_panBgView.mas_centerY);
    }];
}


#pragma mark  Gesture delegate
- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer {
    
    if ([gestureRecognizer isKindOfClass:[UIPanGestureRecognizer class]]) {
        UIPanGestureRecognizer * panGestureRecognizer = (UIPanGestureRecognizer *)gestureRecognizer;
        CGPoint translation = [panGestureRecognizer translationInView:self.view];
        return fabs(translation.x) > fabs(translation.y) ;
    }
    return YES;
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldReceiveTouch:(UITouch *)touch {
    
    UIViewController * vc = [self currentViewController];
    if (vc==nil) {
        return NO;
    }
    if (vc.needHandlePanGestureRecognizer==NO) {
        return NO;
    }
    
    //多余一个手指的手势不再处理
    if(gestureRecognizer.numberOfTouches>0){
        return NO;
    }
    
    return YES;
}

- (BOOL) gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    
    if ([otherGestureRecognizer.view isKindOfClass:[UITableView class]]){
        return NO;
    }
    if ([otherGestureRecognizer.view isKindOfClass:[UICollectionView class]]){
        return NO;
    }
    if ([otherGestureRecognizer.view isKindOfClass:[UIScrollView class]]) {
        UIScrollView * scrollView = (UIScrollView *)otherGestureRecognizer.view;
        if (scrollView.contentSize.width > CGRectGetWidth(scrollView.frame)) {
            if (scrollView.contentOffset.x == 0) {
                return YES;
            }
        }
    }
    return NO;
}

- (void) gestureRecognizerDidPan:(UIPanGestureRecognizer*)panGesture {
    if (self.viewControllers.count<=1) {
        return;
    }

    //移动速度
    CGPoint velocity = [panGesture velocityInView:self.view];
    PanDirection panDirection = PanDirectionNone;
    if (velocity.x > 0) {
        panDirection = PanDirectionRight;
    } else {
        panDirection = PanDirectionLeft;
    }
    
    if (panGesture.state == UIGestureRecognizerStateBegan){
        CGPoint translationPoint = [panGesture translationInView:self.view];
        _changePanX = translationPoint.x;
    }
    if (panGesture.state == UIGestureRecognizerStateChanged){
        //移动相对坐标
        CGPoint translationPoint = [panGesture translationInView:self.view];
        CGFloat calPanX = translationPoint.x -_changePanX;
        _changePanX = translationPoint.x;
        
        CGRect imvRect = _panBgView.frame;
        imvRect.origin.x = imvRect.origin.x + calPanX;
        if (imvRect.origin.x>=-6) {
            imvRect.origin.x=-6;
        }
        if (imvRect.origin.x<=-66) {
            imvRect.origin.x=-66;
        }
        _panBgView.frame = imvRect;
    }
    if (panGesture.state == UIGestureRecognizerStateEnded || panGesture.state == UIGestureRecognizerStateCancelled) {

        //移动相对坐标
//        CGPoint translationPoint = [panGesture translationInView:self.view];
        if(_panBgView.frame.origin.x >= -16.66) {
            [self completeSlidingAnimationWithDirection:panDirection];
        }else {
            [self rightPanBgViewAnimation];
        }
    }
}


- (void)rightPanBgViewAnimation{
    [UIView animateWithDuration:kAnimationDuration animations:^{
        CGRect panRect = _panBgView.frame;
        panRect.origin.x = -66;
        _panBgView.frame = panRect;
    } completion:^(BOOL finished) {}];
}
//完成
- (void) completeSlidingAnimationWithDirection:(PanDirection)direction {
    
    UIViewController * panGestureRecognizerVC = [self currentViewController];
    if(direction==PanDirectionRight){
        if (panGestureRecognizerVC.handlePanGestureBlcok) {
            panGestureRecognizerVC.handlePanGestureBlcok();
        }else{
            [self popViewControllerAnimated:YES];
        }
    }
    else if (direction==PanDirectionLeft){}
    [self rightPanBgViewAnimation];
}

- (BOOL)hidesBottomBarWhenPushed {
    return YES;
}

@end


#pragma mark - 扩展UIViewController
@implementation UIViewController (MyNavigationController)

@dynamic handlePanGestureBlcok;
@dynamic needHandlePanGestureRecognizer;

-(void)setNeedHandlePanGestureRecognizer:(BOOL)needHandlePanGestureRecognizer {
    
    NSNumber * result = [NSNumber numberWithBool:needHandlePanGestureRecognizer];
    objc_setAssociatedObject(self, @selector(needHandlePanGestureRecognizer),result, OBJC_ASSOCIATION_ASSIGN);
}

-(BOOL)needHandlePanGestureRecognizer{
    BOOL result = NO;
    NSNumber * num = objc_getAssociatedObject(self, @selector(needHandlePanGestureRecognizer));
    if (num) {
        result = [num boolValue];
    }
    return result;
}



- (void)setHandlePanGestureBlcok:(void (^)(void))handlePanGestureBlcok {
    objc_setAssociatedObject(self, @selector(handlePanGestureBlcok), handlePanGestureBlcok, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (void (^)(void))handlePanGestureBlcok{
    void (^ hh)(void) = objc_getAssociatedObject(self, @selector(handlePanGestureBlcok));
    return hh;
}

@end


