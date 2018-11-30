//
//  MeViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "MeViewController.h"

@interface MeViewController ()

@property(nonatomic) UIButton *tagButton;
@end

@implementation MeViewController

- (void) viewDidLoad{
    [super viewDidLoad];
    _tagButton=[[UIButton alloc]initWithFrame:CGRectMake(200, 200, 120, 120)];
    _tagButton.layer.cornerRadius=5;
    _tagButton.layer.masksToBounds=YES;
    [_tagButton setBackgroundColor:UIColor.blackColor];
    [_tagButton setTitle:@"我的页" forState:UIControlStateNormal];
    [self.view addSubview:_tagButton];
    
    UITextField *editText=[[UITextField alloc]initWithFrame:CGRectMake(100, 100, 200, 100)];
    [editText setBackgroundColor:UIColor.grayColor];
    [editText setTextColor:UIColor.blackColor];
    [self.view addSubview:editText];
}

@end
