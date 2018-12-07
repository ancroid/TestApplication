//
//  NewsViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "NewsViewController.h"
#import "CRMainView.h"
#import "MeViewController.h"
#import "UIImageView+WebCache.h"
#import "CRCollectionDelegate.h"

@interface NewsViewController ()<UIScrollViewDelegate,NewsCellOnclickListener>

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic, strong) CRCollectionDelegate *delegate;

@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _delegate = [[CRCollectionDelegate alloc]init];
    _delegate.delegateClick=self;
    _scrollView = [[UIScrollView alloc] initWithFrame:self.view.frame];
    _scrollView.scrollEnabled = YES;
    _scrollView.delegate = self;
    [self.view addSubview:_scrollView];

    _imageView = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:@"https://img13.360buyimg.com/da/jfs/t4315/111/3207521179/241313/c4ec9569/58dcb13cN89094d67.jpg"] placeholderImage:[UIImage imageNamed:@"header.png"]];
    [_scrollView addSubview:_imageView];
    NSLog(@"viewDidLoad %@", @(self.view.frame.size.height).stringValue);

    [self initCollectionView];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    _scrollView.contentSize = CGSizeMake(self.view.frame.size.width, self.collectionView.contentSize.height + 300);
    NSLog(@"viewDidAppear %@", @(self.collectionView.contentSize.height).stringValue);
}

- (void)initCollectionView {
    if (@available(iOS 11.0, *)) {
        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 300, self.view.bounds.size.width, self.view.bounds.size.height) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    _collectionView.backgroundColor = UIColor.lightGrayColor;

    _collectionView.delegate = _delegate;
    _collectionView.dataSource = _delegate;
    _collectionView.scrollEnabled = NO;
    [self.scrollView addSubview:_collectionView];
    [_collectionView registerClass:[CRMainView class] forCellWithReuseIdentifier:@"normalList"];
//    dispatch_async(dispatch_get_global_queue(0, 0), ^{
//        NSLog(@"start");
//        sleep(2);
//        dispatch_async(dispatch_get_main_queue(), ^{
//            NSLog(@"ui refresh");
//        });
//    });
}



- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat height = scrollView.frame.size.height;
//    CGFloat contentYoffset = scrollView.contentOffset.y;
//    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYoffset;
//    if (distanceFromBottom<=height) {
//        NSLog(@"end");
//    }

    CGFloat sy = scrollView.contentOffset.y;
    if (sy > 300) {
        [_collectionView setContentOffset:CGPointMake(0,sy - 300)];
        [_collectionView setFrame:CGRectMake(0, sy, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height)];
    } else {
        [_collectionView setFrame:CGRectMake(0, 300, self.collectionView.bounds.size.width, self.collectionView.bounds.size.height)];
        [_collectionView setContentOffset:CGPointMake(0, 0)];
    }
    NSLog(@"scrollViewDidScroll %@", @(sy).stringValue);
    NSLog(@"view origin %@", @(_collectionView.frame.origin.y).stringValue);
}

-(void) onClick{
    [self.navigationController pushViewController:[[MeViewController alloc]init] animated:YES];
}


@end
