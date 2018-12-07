//
//  CRCollectionViewLayout.m
//  DemoApplication
//
//  Created by chenrui on 2018/12/6.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "CRCollectionViewLayout.h"

#define ColunmCount  2
#define ColunmMargin 5
#define RowMargin    15

@interface CRCollectionViewLayout ()

@property (nonatomic) NSMutableArray *attributesArray;
@property (nonatomic) NSMutableArray *columnHeights;
@property (nonatomic) NSMutableArray *cellHeights;
@property (nonatomic, assign) CGFloat contentHeight;
@property (nonatomic, assign) NSUInteger columnCount;
@property (nonatomic, assign) CGFloat columnMargin;
@property (nonatomic, assign) CGFloat rowMargin;

@end

@implementation CRCollectionViewLayout

- (void)initData {
    _columnCount = ColunmCount;
    _columnMargin = ColunmMargin;
    _rowMargin = RowMargin;
    _attributesArray = [NSMutableArray array];
    _columnHeights = [NSMutableArray array];
}

- (void)prepareLayout {
    NSLog(@"prepareLayout");
    [super prepareLayout];

    self.contentHeight = 0;
    [self.columnHeights removeAllObjects];

    for (NSUInteger i = 0; i < _columnCount; i++) {
        [_columnHeights addObject:@(0)];
    }
    //清除上一次的布局信息
    [self.attributesArray removeAllObjects];
    //创建每一个cell的布局属性
    NSInteger count = [self.collectionView numberOfItemsInSection:0];
    for (int i = 0; i < count; i++) {
        NSIndexPath *indexPath = [NSIndexPath indexPathForItem:i inSection:0];
        UICollectionViewLayoutAttributes *attrs = [self layoutAttributesForItemAtIndexPath:indexPath];
        [self.attributesArray addObject:attrs];
    }
}

- (UICollectionViewLayoutAttributes *)layoutAttributesForItemAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"layoutAttributesForItemAtIndexPath");
    UICollectionViewLayoutAttributes *attrs = [UICollectionViewLayoutAttributes layoutAttributesForCellWithIndexPath:indexPath];
    CGFloat collectionViewWidth = self.collectionView.frame.size.width;

    CGFloat cellWidth = (collectionViewWidth - (self.columnCount - 1) * self.columnMargin) / self.columnCount;
    CGFloat cellHeight = [self heightForItemAtIndexPath:indexPath.row] + 350;

    //找出高度最小的列
    NSInteger destColumn = 0;
    CGFloat minColumnHeight = [[self.columnHeights firstObject] floatValue];
    for (int i = 0; i < _columnCount; i++) {
        CGFloat columnHeight = [[self.columnHeights objectAtIndex:i] floatValue];
        if (minColumnHeight > columnHeight) {
            minColumnHeight = columnHeight;
            destColumn = i;
        }
    }

    CGFloat cellX = destColumn * (cellWidth + self.columnMargin);
    CGFloat cellY = minColumnHeight;
    if (cellY!=0) {
        cellY+= self.rowMargin;
    }

    attrs.frame = CGRectMake(cellX, cellY, cellWidth, cellHeight);

    self.columnHeights[destColumn] = @(CGRectGetMaxY(attrs.frame));

    CGFloat maxColumnHeight = [self.columnHeights[destColumn] floatValue];
    if (self.contentHeight < maxColumnHeight) {
        self.contentHeight = maxColumnHeight;
    }
    return attrs;
}

- (NSArray<UICollectionViewLayoutAttributes *> *)layoutAttributesForElementsInRect:(CGRect)rect {
    return self.attributesArray;
}

- (CGSize)collectionViewContentSize {
    return CGSizeMake(0, self.contentHeight);
}

#pragma mark - 数据设置
- (void)setCellHeightsInLayout:(NSMutableArray *)cellHeights {
    self.cellHeights = cellHeights;
}

- (CGFloat)heightForItemAtIndexPath:(NSUInteger)indexPath {
    return [[_cellHeights objectAtIndex:indexPath] doubleValue];
}

- (void)columnCountInLayout:(NSUInteger)count {
    _columnCount = count;
}

- (void)columnMarginInLayout:(CGFloat)columnMargin {
    _columnMargin = columnMargin;
}

- (void)rowMarginInLayout:(CGFloat)rowMargin {
    _rowMargin = rowMargin;
}

- (void)edgeInsetInLayout:(UIEdgeInsets)edgeInsets {
}

@end
