//
//  HTListCellView.m
//  DemoApplication
//
//  Created by chenrui on 2018/12/5.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "HTListCellView.h"

@implementation HTListCellView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = UIColor.whiteColor;

        [self addSubview:({
            _image = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, frame.size.width, 300)];
            _image;
        })];
        
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, frame.size.width, 60)];
        view.backgroundColor = [UIColor blackColor];
        view.alpha = 0.5;
        [self addSubview:view];
        
        [view addSubview:({
            _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 8, frame.size.width, 50)];
            _titleLabel.font = [UIFont fontWithName:@"Helvetica-Bold"  size:16.f];
            _titleLabel.textColor = [UIColor whiteColor];
            _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _titleLabel.textAlignment= NSTextAlignmentCenter;
            _titleLabel.numberOfLines = 0;
            _titleLabel;
        })];
        [self addSubview:({
            _subTitleLabel = [[UILabel alloc]init];
            _subTitleLabel.font = [UIFont systemFontOfSize:15.f];
            _subTitleLabel.numberOfLines = 0;
            _titleLabel.lineBreakMode = NSLineBreakByWordWrapping;
            _subTitleLabel.textColor = [UIColor blackColor];
            _subTitleLabel;
        })];
        [self addSubview:({
            _sourceLabel = [[UILabel alloc]initWithFrame:CGRectMake(4, 303, frame.size.width - 8, 20)];
            _sourceLabel.font = [UIFont systemFontOfSize:12.f];
            _sourceLabel.textAlignment = NSTextAlignmentRight;
            _sourceLabel.textColor = [UIColor grayColor];
            _sourceLabel;
        })];
    }
    return self;
}

@end
