//
//  CRNavigationViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/28.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "CRNavigationViewController.h"
#import "UIBarButtonItem+CR.h"
@interface CRNavigationViewController ()

@end

@implementation CRNavigationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

-(void) pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (self.viewControllers.count>0) {
        viewController.hidesBottomBarWhenPushed=YES;
        viewController.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithImageName:@"navigation_icon_back" hightImageName:nil target:self action:@selector(c_back)];
        //全局右滑pop
        self.interactivePopGestureRecognizer.delegate=nil;
    }
    [super pushViewController:viewController animated:animated];
}

-(void) c_back{
    [self popViewControllerAnimated:YES];
}

-(UIViewController *)childViewControllerForStatusBarStyle{
    return self.topViewController;
}

@end
