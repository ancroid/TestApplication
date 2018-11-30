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


#define SCREEN_HEIGHT [UIScreen mainScreen].bounds.size.height
#define IS_IPHONEX (SCREEN_HEIGHT == 812 || SCREEN_HEIGHT == 896)
#define NAVIGATIONBAR_HEIGHT (IS_IPHONEX ? 88 : 64)
#define NAVIGATIONBAR_BOTTOM_HEIGHT (IS_IPHONEX ? 49 : 0)
#define HOME_INDICATIOR_HEIGHT 34

@interface NewsViewController ()<UICollectionViewDataSource, UICollectionViewDelegate, UIScrollViewDelegate>

@property (nonatomic) UIImageView *imageView;
@property (nonatomic) UIScrollView *scrollView;
@property (nonatomic) UICollectionView *collectionView;
@property (nonatomic, copy) NSArray *cellInfo;



@end

@implementation NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    _scrollView =[[UIScrollView alloc] initWithFrame:CGRectMake(0, NAVIGATIONBAR_HEIGHT, self.view.frame.size.width, self.view.frame.size.height-NAVIGATIONBAR_HEIGHT-NAVIGATIONBAR_BOTTOM_HEIGHT-HOME_INDICATIOR_HEIGHT)];
    _scrollView.scrollEnabled=YES;
    _scrollView.delegate=self;

    [self.view addSubview:_scrollView];

    _imageView =[[UIImageView alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 300)];
    [_imageView sd_setImageWithURL:[NSURL URLWithString:@"https://img13.360buyimg.com/da/jfs/t4315/111/3207521179/241313/c4ec9569/58dcb13cN89094d67.jpg"] placeholderImage:[UIImage imageNamed:@"header.png"]];
    [_scrollView addSubview:_imageView];
    
    [self initCollectionView];
}
-(void)viewDidAppear:(BOOL)animated{
    [super viewDidAppear: animated];
     _scrollView.contentSize=CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.height);
}

- (void)initCollectionView {
    _cellInfo = @[@"view", @"view层",@"model", @"model层",@"controller", @"controller层",@"mvc", @"mvc模式", @"view层",@"model", @"model层",@"controller", @"controller层",@"mvc", @"mvc模式"];

    _collectionView = [[UICollectionView alloc]initWithFrame:CGRectMake(0, 300, self.view.bounds.size.width, self.view.bounds.size.height-300) collectionViewLayout:[[UICollectionViewFlowLayout alloc] init]];
    _collectionView.backgroundColor = UIColor.lightGrayColor;
    _collectionView.dataSource = self;
    _collectionView.delegate = self;
    if (@available(iOS 11.0, *)) {
        _collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    };
    [self.scrollView addSubview:_collectionView];
    [_collectionView registerClass:[CRMainView class] forCellWithReuseIdentifier:@"normalList"];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[CRMainView class]] && _cellInfo.count > 0) {
        ((CRMainView *)cell).titleLabel.text = [_cellInfo objectAtIndex:indexPath.row];
        ((CRMainView *)cell).subTitleLabel.text =@"test";
    }
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"normalList" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _cellInfo.count;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 1.f;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake([[UIScreen mainScreen] bounds].size.width, 100);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath{
    NSLog(@"click %@", @(indexPath.item).stringValue);
    [self.navigationController pushViewController:[[MeViewController alloc]init] animated:YES];
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat height = scrollView.frame.size.height;
    CGFloat contentYoffset = scrollView.contentOffset.y;
    CGFloat distanceFromBottom = scrollView.contentSize.height - contentYoffset;
    if (distanceFromBottom<=height) {
        NSLog(@"end");
    }
}

@end
