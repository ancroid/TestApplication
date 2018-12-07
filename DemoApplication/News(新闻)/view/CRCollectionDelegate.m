//
//  CRCollectionDelegate.m
//  DemoApplication
//
//  Created by chenrui on 2018/12/4.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "CRCollectionDelegate.h"
#import "CRMainView.h"
#import "MeViewController.h"

@interface CRCollectionDelegate()
@property (nonatomic, copy) NSArray *cellInfo;

@end
@implementation CRCollectionDelegate

- (instancetype)init{
    self =[super init];
    if (self) {
         _cellInfo = @[@"view", @"view层",@"model", @"model层",@"controller", @"controller层",@"mvc", @"mvc模式", @"view层1",@"model1", @"model层1",@"controller1", @"controller层1",@"mvc1", @"mvc模式1"];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
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
    [_delegateClick onClick];
}

@end
