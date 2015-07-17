//
//  EnhancedPageViewController.h
//  EnhancedPage
//
//  Created by HuangYiFeng on 7/16/15.
//  Copyright (c) 2015 HYF. All rights reserved.
//

//typedef ns_enum {
//    UIPageViewControllerTransitionStylePoker,
//    
//}UIPageViewControllerTransitionStyleCustom;

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger, UIPageViewControllerTransitionStyleCustom) {
    UIPageViewControllerTransitionStylePoker = 1 << 7
};

@interface EnhancedPageViewController : UIPageViewController

@end
