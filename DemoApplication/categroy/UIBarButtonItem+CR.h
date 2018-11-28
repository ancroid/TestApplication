//
//  UIBarButtonItem+CR.h
//  DemoApplication
//
//  Created by chenrui on 2018/11/28.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import <UIKit/UIKit.h>



@interface UIBarButtonItem (CR)
+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName hightImageName:(NSString *)hightImageName target:(id)target action:(SEL)action;

@end

