//
//  VideoViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "VideoViewController.h"
#import "AFNetworking.h"
#import "YYModel.h"
#import "UIImageView+WebCache.h"
#import "MJRefresh.h"
#import "CRCollectionViewLayout.h"

#define CELLWIDTH ([[UIScreen mainScreen] bounds].size.width - 10) / 2

@interface VideoViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic) NSMutableArray *items;
@property (nonatomic) NSMutableArray *itemsHeight;

@end

@implementation VideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.items = [NSMutableArray arrayWithCapacity:10];
    self.itemsHeight = [NSMutableArray arrayWithCapacity:10];
    
    [self getDataFromUrl];
}



- (void)initCollectionView {
    CRCollectionViewLayout *layout = [[CRCollectionViewLayout alloc] init];
    [layout initData];
    [layout setCellHeightsInLayout:_itemsHeight];
    _collectionView = [[UICollectionView alloc]initWithFrame:self.view.bounds collectionViewLayout:layout];
    _collectionView.backgroundColor = UIColor.lightGrayColor;
    if (@available(iOS 11.0, *)) {
        self.collectionView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    } else {
        // Fallback on earlier versions
    }
    _collectionView.contentInset = UIEdgeInsetsMake(88, 0, 49+34, 0);
    _collectionView.delegate = self;
    _collectionView.dataSource = self;
    [self.view addSubview:_collectionView];
    [_collectionView registerClass:[HTListCellView class] forCellWithReuseIdentifier:@"HTList"];

    _collectionView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self.collectionView.mj_header beginRefreshing];
        [self getDataFromUrl];
    }];

    _collectionView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
        [self.collectionView.mj_footer beginRefreshing];
        [self getDataMore];
    }];
}

- (void)collectionView:(UICollectionView *)collectionView willDisplayCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath {
    if ([cell isKindOfClass:[HTListCellView class]] && _items.count > 0) {
        cell.layer.cornerRadius = 5;

        Items *cellItem = [_items objectAtIndex:indexPath.row];
        UIImageView *image = ((HTListCellView *)cell).image;
        [image sd_setImageWithURL:[NSURL URLWithString:cellItem.shortcut] placeholderImage:[UIImage imageNamed:@"header.png"]];
        ((HTListCellView *)cell).titleLabel.text = cellItem.title;
        ((HTListCellView *)cell).subTitleLabel.text = cellItem.long_summary;
        ((HTListCellView *)cell).sourceLabel.text = [NSString stringWithFormat:@"来源: %@", cellItem.srcfrom];
        UILabel *label = ((HTListCellView *)cell).subTitleLabel;
        CGFloat height = [(NSNumber *)[_itemsHeight objectAtIndex:indexPath.row] floatValue];
        [label setFrame:CGRectMake(20, 325, cell.frame.size.width - 40, height)];
    }
}

- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HTList" forIndexPath:indexPath];
    return cell;
}

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _items.count;
}

//- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
//    return 2.f;
//}
//
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CGFloat height=[(NSNumber *)[_itemsHeight objectAtIndex:indexPath.row] floatValue];
//    return CGSizeMake(CELLWIDTH, height+350);
//}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    NSLog(@"click %@", @(indexPath.row).stringValue);
}

#pragma mark - 获取数据
- (void)getDataFromUrl {
    NSDictionary *parameters = @{
        @"channel": @"dr_jingxuan",
        @"pn": @"1"
    };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://test.dreamreader.qq.com/v1/article_listen/lists" parameters:parameters
        progress:^(NSProgress *_Nonnull downloadProgress) {
        NSLog(@"downloadProgress-->%@", downloadProgress);
    } success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        HTDataModel *model = [HTDataModel yy_modelWithDictionary:responseObject];
        if ([model errnum] == 0) {
            NSLog(@"getDataFromUrl %@", [model data].cnt);
            [self clearData];
            [self resolveData:[[model data] items]];
            [self.items addObjectsFromArray:[[model data] items]];
            if ([self.collectionView.mj_header isRefreshing]) {
                [self.collectionView reloadData];
                [self.collectionView.mj_header endRefreshing];
            } else {
                [self initCollectionView];
            }
        }
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        NSLog(@"error %@", error);
    }];
}

- (void)getDataMore {
    NSDictionary *parameters = @{
        @"channel": @"dr_jingxuan",
        @"pn": @"-1"
    };
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager GET:@"http://test.dreamreader.qq.com/v1/article_listen/lists" parameters:parameters
        progress:^(NSProgress *_Nonnull downloadProgress) {
        NSLog(@"downloadProgress-->%@", downloadProgress);
    } success:^(NSURLSessionDataTask *_Nonnull task, id _Nullable responseObject) {
        HTDataModel *model = [HTDataModel yy_modelWithDictionary:responseObject];
        if ([model errnum] == 0) {
            NSLog(@"getDataMore %@", [model data].cnt);
            [self resolveData:[[model data] items]];
            [self.items addObjectsFromArray:[[model data] items]];
            [self.collectionView reloadData];
            [self.collectionView.mj_footer endRefreshing];
        }
    } failure:^(NSURLSessionDataTask *_Nullable task, NSError *_Nonnull error) {
        NSLog(@"error %@", error);
    }];
}

- (void)resolveItemStringHeight:(NSString *)str {
    NSMutableAttributedString *attributeString = [[NSMutableAttributedString alloc] initWithString:str];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.lineSpacing = 0;
    [attributeString addAttribute:NSParagraphStyleAttributeName value:style range:NSMakeRange(0, str.length)];
    [attributeString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15.f] range:NSMakeRange(0, str.length)]; NSStringDrawingOptions options = NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading;
    CGRect rect = [attributeString boundingRectWithSize:CGSizeMake(CELLWIDTH, MAXFLOAT) options:options context:nil];
    [self.itemsHeight addObject:[NSNumber numberWithFloat:rect.size.height]];
    NSLog(@"size:%@", @(rect.size.height).stringValue);
}

- (void)resolveData:(NSArray *)items {
    for (int i = 0; i < items.count; i++) {
        NSString *str = ((Items *)[items objectAtIndex:i]).long_summary;
        [self resolveItemStringHeight:str];
    }
}

- (void)clearData {
    [self.items removeAllObjects];
    [self.itemsHeight removeAllObjects];
}

@end
