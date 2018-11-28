//
//  UIBarButtonItem+CR.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/28.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "UIBarButtonItem+CR.h"

@implementation UIBarButtonItem (CR)

+ (UIBarButtonItem *)itemWithImageName:(NSString *)imageName hightImageName:(NSString *)hightImageName target:(id)target action:(SEL)action {
    
    UIButton *button = [[UIButton alloc] init];
    
    [button setBackgroundImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    if (hightImageName) {
        [button setBackgroundImage:[UIImage imageNamed:hightImageName] forState:UIControlStateHighlighted];
    }
    
//    button.size = button.currentBackgroundImage.size;
    
    [button addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    return [[UIBarButtonItem alloc] initWithCustomView:button];
}
@end
