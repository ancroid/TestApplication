//
//  HTListCellView.h
//  DemoApplication
//
//  Created by chenrui on 2018/12/5.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HTListCellView : UICollectionViewCell

@property(nonatomic, strong) UIImageView *image;
@property(nonatomic, strong) UILabel *titleLabel;
@property(nonatomic, strong) UILabel *subTitleLabel;
@property(nonatomic, strong) UILabel *sourceLabel;

@end

