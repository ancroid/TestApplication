//
//  BaseViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "BaseViewController.h"

#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IS_IPHONEX (SCREEN_HEIGHT == 812 || SCREEN_HEIGHT == 896)
#define NAVIGATIONBAR_HEIGHT (IS_IPHONEX ? 88 : 64)
#define NAVIGATIONBAR_BOTTOM_HEIGHT (IS_IPHONEX ? 49 : 0)
#define HOME_INDICATIOR_HEIGHT 34


@interface BaseViewController ()

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        self.automaticallyAdjustsScrollViewInsets = NO;
        self.view.backgroundColor=UIColor.lightGrayColor;
        [self.view setFrame:CGRectMake(0, NAVIGATIONBAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height-NAVIGATIONBAR_HEIGHT-NAVIGATIONBAR_BOTTOM_HEIGHT-HOME_INDICATIOR_HEIGHT)];
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
    
}

@end
