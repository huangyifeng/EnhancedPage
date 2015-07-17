//
//  PokerViewController.m
//  EnhancedPage
//
//  Created by HuangYiFeng on 7/17/15.
//  Copyright (c) 2015 HYF. All rights reserved.
//

#import "PokerViewController.h"

CGFloat const POKER_ANIMATION_DURATION = 0.3;

@interface PokerViewController ()

//@property(nonatomic, strong)UIViewController *currentController;
//@property(nonatomic, strong)UIViewController *nextController;

@property(nonatomic, strong)NSMutableArray *controllerStack; //max is 3
@property(nonatomic, strong)UIViewController *previousController;

@property(nonatomic, assign)NSInteger currentIndex;

//private
- (void)initViewComponent;
- (void)initModelComponent;

- (void)goToNextView:(BOOL)animated;
- (void)goToPreviousView:(BOOL)animated;

- (UIViewController *)getControllerAfterController:(UIViewController *)controller;
- (UIViewController *)getControllerBeforeController:(UIViewController *)controller;

//Action
- (void)moveStart:(BOOL)goNext;
//- (void)moveChanged;
- (void)panHandler:(UIPanGestureRecognizer *)pan;

@end

@implementation PokerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - public 

- (void)setViewController:(UIViewController *)controller animated:(BOOL)animated completion:(void (^)())completion
{
    
}

#pragma mark - private

- (void)initViewComponent
{
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panHandler:)];
    [self.view addGestureRecognizer:pan];
}

- (void)moveStart:(BOOL)goNext
{
    UIViewController *toController = nil;
    if (goNext)
    {
        toController = [self getNextController];
    }
    else
    {
        toController = [self getPreviousController];
    }
    
    //if no toController, do nothing
    if (!toController)
    {
        return;
    }
    
    //call delegate
    if ([self.delegate respondsToSelector:@selector(pokerViewController:willTransitionToViewController:)])
    {
        [self.delegate pokerViewController:self willTransitionToViewController:toController];
    }
}

- (UIViewController *)getControllerAfterController:(UIViewController *)controller
{
    UIViewController *retVal = nil;
    if ([self.dataSource respondsToSelector:@selector(pokerViewController:viewControllerAfterViewController:)])
    {
        retVal = [self.dataSource pokerViewController:self viewControllerAfterViewController:controller];
    }
    return retVal;
}

- (UIViewController *)getControllerBeforeController:(UIViewController *)controller
{
    UIViewController *retVal = nil;
    if ([self.dataSource respondsToSelector:@selector(pokerViewController:viewControllerBeforeViewController:)])
    {
        retVal = [self.dataSource pokerViewController:self viewControllerBeforeViewController:controller];
    }
    return retVal;
}

- (void)goToNextView:(BOOL)animated
{
    UIViewController *currentController = [_controllerStack objectAtIndex:0];
    CALayer *layer = currentController.view.layer;
    CGRect frame = layer.frame;
    
    layer.anchorPoint = CGPointMake(CGRectGetWidth(frame), CGRectGetHeight(frame));
    CGAffineTransform rotation = CGAffineTransformMakeRotation(0.5);
    CGAffineTransform translation = CGAffineTransformMakeTranslation(-CGRectGetWidth(frame), 0);
    CGAffineTransform move = CGAffineTransformConcat(rotation, translation);
    
    void (^clean)() = ^void(){
        [currentController.view removeFromSuperview];
        [currentController removeFromParentViewController];
        [_controllerStack removeObjectAtIndex:0];
    };
    
    if (animated)
    {
        [UIView animateWithDuration:POKER_ANIMATION_DURATION animations:^{
            currentController.view.transform = move;
        } completion:^(BOOL finished) {
            clean();
        }];
    }
    else
    {
        currentController.view.transform = move;
        clean();
    }
}

- (void)goToPreviousView:(BOOL)animated
{
    if (!_previousController)
    {
        return;
    }
    CGRect frame = _previousController.view.frame;
    
    CGAffineTransform rotation = CGAffineTransformMakeRotation(<#CGFloat angle#>);
}

#pragma mark - Action

- (void)panHandler:(UIPanGestureRecognizer *)pan
{
    if (UIGestureRecognizerStateBegan == pan.state)
    {
        CGPoint velocity = [pan velocityInView:pan.view];
        BOOL goNext = velocity.x < 0;
        [self moveStart:goNext];
    }
    else if(UIGestureRecognizerStateChanged == pan.state)
    {
        
    }
    else if(UIGestureRecognizerStateEnded == pan.state)
    {
        
    }
}



@end
