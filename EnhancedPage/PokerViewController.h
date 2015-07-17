//
//  PokerViewController.h
//  Enhanced
//
//  Created by HuangYiFeng on 7/17/15.
//  Copyright (c) 2015 HYF. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PokerViewController;

//PokerViewControllerDataSource ===========================================

@protocol PokerViewControllerDataSource <NSObject>

@optional
- (UIViewController *)pokerViewController:(PokerViewController *)pokerController
       viewControllerBeforeViewController:(UIViewController *)viewController;

- (UIViewController *)pokerViewController:(PokerViewController *)pokerController
        viewControllerAfterViewController:(UIViewController *)viewController;

- (NSInteger)presentationCountForPokerViewController:(PokerViewController *)pokerController;
- (NSInteger)presentationIndexForPokerViewController:(PokerViewController *)pokerController;

@end

//PokerViewControllerDelegate ===========================================

@protocol PokerViewControllerDelegate <NSObject>

@optional
- (void)pokerViewController:(PokerViewController *)pokerController
willTransitionToViewController:(UIViewController *)pendingController;

- (void)pokerViewController:(PokerViewController *)pokerController
         didFinishAnimating:(BOOL)finished
     previousViewController:(UIViewController *)previousController
        transitionCompleted:(BOOL)completed;

@end

//PokerViewController ===========================================

@interface PokerViewController : UIViewController

@property(nonatomic, strong)NSObject<PokerViewControllerDataSource> *dataSource;
@property(nonatomic, strong)NSObject<PokerViewControllerDelegate> *delegate;

@property(nonatomic, strong, readonly)UIViewController *displayedController;

- (void)setViewController:(UIViewController *)controller
                 animated:(BOOL)animated
               completion:(void(^)())completion;

@end
