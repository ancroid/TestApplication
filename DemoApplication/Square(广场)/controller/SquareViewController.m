//
//  SquareViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "SquareViewController.h"
@interface SquareViewController ()

@property(nonatomic) UIButton *tagButton;
@end

@implementation SquareViewController

- (void) viewDidLoad{
    _tagButton=[[UIButton alloc]initWithFrame:CGRectMake(200, 200, 120, 120)];
    [_tagButton setBackgroundColor:UIColor.blackColor];
    [_tagButton setTitle:@"广场页" forState:UIControlStateNormal];
    [self.view addSubview:_tagButton];
}

@end
