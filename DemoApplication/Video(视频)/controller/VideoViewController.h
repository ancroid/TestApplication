//
//  VideoViewController.h
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "BaseViewController.h"
#import "HTDataModel.h"
#import "HTListCellView.h"

@interface VideoViewController :BaseViewController

@property(nonatomic) UICollectionView *collectionView;
@property(nonatomic) HTDataModel *model;

@end

