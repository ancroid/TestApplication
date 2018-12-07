//
//  CRCollectionViewLayout.h
//  DemoApplication
//
//  Created by chenrui on 2018/12/6.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface CRCollectionViewLayout : UICollectionViewLayout

-(void) initData;

-(void) setCellHeightsInLayout:(NSMutableArray *)cellHeights;

-(void) columnCountInLayout:(NSUInteger) count;

-(void) columnMarginInLayout:(CGFloat) columnMargin;

-(void) rowMarginInLayout:(CGFloat) rowMargin;

-(void) edgeInsetInLayout:(UIEdgeInsets) edgeInsets;

@end


