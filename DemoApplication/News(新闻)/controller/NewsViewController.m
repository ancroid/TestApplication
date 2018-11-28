//
//  NewsViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "NewsViewController.h"
@interface NewsViewController ()

@property(nonatomic) UIButton *tagButton;

@property(nonatomic,weak)UICollectionView *collectionView;

@end

@implementation NewsViewController

- (void) viewDidLoad{
    _tagButton=[[UIButton alloc]initWithFrame:CGRectMake(200, 200, 120, 120)];
    [_tagButton setBackgroundColor:UIColor.blackColor];
    [_tagButton setTitle:@"新闻页" forState:UIControlStateNormal];
    [self.view addSubview:_tagButton];
}

@end
