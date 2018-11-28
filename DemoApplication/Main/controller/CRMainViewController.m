//
//  CRViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "CRMainViewController.h"
#import "NewsViewController.h"
#import "VideoViewController.h"
#import "SquareViewController.h"
#import "MeViewController.h"
#import "CRNavigationViewController.h"

@interface CRMainViewController () <UITabBarControllerDelegate>

@property (nonatomic, weak) UIViewController    *lastSelect;
@property(nonatomic, weak) NewsViewController * newsVC;
@property(nonatomic, weak) VideoViewController * videoVC;
@property(nonatomic, weak) SquareViewController * squareVC;
@property(nonatomic, weak) MeViewController * meVC;


@end

@implementation CRMainViewController

+ (CRMainViewController *) sharedInstance{
    static CRMainViewController *vc;
    static dispatch_once_t one;
    dispatch_once(&one,^{
        vc=[[self alloc]init];
    });
    return vc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self initAllChildVCs];
    self.delegate= self;
}
- (void)initAllChildVCs{
    NewsViewController *newsVC=[[NewsViewController alloc]init];
    [self addMyChildViewController:newsVC title:@"新闻" imageName:@"tab_icon_news"];
    self.newsVC=newsVC;
    
    VideoViewController *videoVC=[[VideoViewController alloc]init];
    [self addMyChildViewController:videoVC title:@"视频" imageName:@"tab_icon_video"];
    self.videoVC=videoVC;
    
    SquareViewController *squareVC=[[SquareViewController alloc]init];
    [self addMyChildViewController:squareVC title:@"广场" imageName:@"tab_icon_square"];
    self.squareVC=squareVC;
    
    MeViewController *meVC=[[MeViewController alloc]init];
    [self addMyChildViewController:meVC title:@"我的" imageName:@"tab_icon_me"];
    self.meVC=meVC;
}
- (void)addMyChildViewController:(UIViewController *)child title:(NSString *)title imageName:(NSString *)imageName{
    child.title= title;
    child.tabBarItem.image=[UIImage imageNamed:imageName];
    
    CRNavigationViewController *navVC=[[CRNavigationViewController alloc]initWithRootViewController:child];
    [self addChildViewController:navVC];
}

-(void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController{
    CRNavigationViewController *navi=(CRNavigationViewController *)viewController;
    
    UIViewController *vc=[navi.childViewControllers firstObject];

    self.lastSelect=vc;
}

@end


