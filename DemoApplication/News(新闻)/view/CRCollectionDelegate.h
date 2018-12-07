//
//  CRCollectionDelegate.h
//  DemoApplication
//
//  Created by chenrui on 2018/12/4.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "BaseViewController.h"

@protocol NewsCellOnclickListener <NSObject>

@required
-(void) onClick;

@end

@interface CRCollectionDelegate :BaseViewController <UICollectionViewDataSource, UICollectionViewDelegate>

@property(nonatomic, weak) id<NewsCellOnclickListener> delegateClick;

@end
