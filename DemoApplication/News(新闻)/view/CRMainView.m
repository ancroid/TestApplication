//
//  CRMainView.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "CRMainView.h"

@interface CRMainView()



@end

@implementation CRMainView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor=UIColor.whiteColor;
        [self addSubview:({
            _titleLabel=[[UILabel alloc]initWithFrame:CGRectMake(8, 10, frame.size.width, frame.size.height/2)];
            _titleLabel.font=[UIFont systemFontOfSize:18.f];
            _titleLabel;
        })];
        [self addSubview:({
            _subTitleLabel =[[UILabel alloc]initWithFrame:CGRectMake(28, frame.size.height/2+4, frame.size.width, frame.size.height/2 -10)];
            _subTitleLabel.font=[UIFont systemFontOfSize:12.f];
            _subTitleLabel.numberOfLines=2;
            _subTitleLabel.textColor=[UIColor lightGrayColor];
            _subTitleLabel;
        })];
        
    }
    return self;
}


@end
