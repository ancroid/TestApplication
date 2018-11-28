//
//  VideoViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "VideoViewController.h"
@interface VideoViewController ()

@property(nonatomic) UIButton *tagButton;
@end

@implementation VideoViewController

- (void) viewDidLoad{
    _tagButton=[[UIButton alloc]initWithFrame:CGRectMake(200, 200, 120, 120)];
    [_tagButton setBackgroundColor:UIColor.blackColor];
    [_tagButton setTitle:@"视频页" forState:UIControlStateNormal];
    [self.view addSubview:_tagButton];
}

@end
