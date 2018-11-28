//
//  CRViewController.h
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018年 chenrui. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM (NSUInteger, TabBarType) {
    TabBarTypeNews,
    TabBarTypeVideo,
    TabBarTypeSquare,
    TabBarTypeMe
};

@interface CRMainViewController : UITabBarController

+ (CRMainViewController *)sharedInstance;
- (instancetype)init __attribute__((unavailable("Disabled. Use +newInstance instead")));
@end
