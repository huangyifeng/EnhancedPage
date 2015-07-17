//
//  ViewController.m
//  EnhancedPage
//
//  Created by HuangYiFeng on 7/16/15.
//  Copyright (c) 2015 HYF. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - PokerViewControllerDataSource

- (UIViewController *)pokerViewController:(PokerViewController *)pokerController viewControllerAfterViewController:(UIViewController *)viewController
{
    
}

- (UIViewController *)pokerViewController:(PokerViewController *)pokerController viewControllerBeforeViewController:(UIViewController *)viewController
{
    
}

@end
