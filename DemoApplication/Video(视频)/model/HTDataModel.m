//
//  HTDataModel.m
//  DemoApplication
//
//  Created by chenrui on 2018/12/5.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "HTDataModel.h"

@implementation HTDataModel

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"errnum" : @"errno"};
}

@end

@implementation Data

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"items" : [Items class]};
}


@end


@implementation Items

+ (NSDictionary<NSString *,id> *)modelContainerPropertyGenericClass{
    return @{@"image_list" : [Image_List class],
             @"voiceinfo" : [Voiceinfo class]};
}

@end



@implementation Commentinfo


@end


@implementation Image_List


@end


@implementation Voiceinfo


@end
