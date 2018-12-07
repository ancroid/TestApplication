//
//  HTDataModel.h
//  DemoApplication
//
//  Created by chenrui on 2018/12/5.
//  Copyright © 2018 ch/Users/chenrui/Desktop/DemoApplication/DemoApplication/Video(视频)/model/HTDataModel.henrui. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Data,Items,Commentinfo,Image_List,Voiceinfo;

# pragma mark - Json数据
@interface HTDataModel : NSObject

@property (nonatomic, assign) NSInteger errnum;

@property (nonatomic, strong) Data *data;

@property (nonatomic, copy) NSString *errmsg;


@end

# pragma mark - data数据
@interface Data : NSObject

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) NSString *cnt;

@end

# pragma mark - Items数据
@interface Items : NSObject

@property (nonatomic, copy) NSString *title;

@property (nonatomic, copy) NSString *cms_pub_time;

@property (nonatomic, strong) NSArray *image_list;

@property (nonatomic, copy) NSString *channel;

@property (nonatomic, copy) NSString *long_summary;

@property (nonatomic, copy) NSString *cms_id;

@property (nonatomic, copy) NSString *flag;

@property (nonatomic, copy) NSString *article_id;

@property (nonatomic, copy) NSString *share_url;

@property (nonatomic, copy) NSString *is_like;

@property (nonatomic, strong) NSArray *dislike_tags;

@property (nonatomic, copy) NSString *corner_mark;

@property (nonatomic, copy) NSString *author_id;

@property (nonatomic, strong) NSArray *voiceinfo;

@property (nonatomic, copy) NSString *show_time;

@property (nonatomic, copy) NSString *rcmdinfo;

@property (nonatomic, strong) Commentinfo *commentinfo;

@property (nonatomic, copy) NSString *shortcut;

@property (nonatomic, copy) NSString *srcfrom;

@property (nonatomic, copy) NSString *article_type;

@end

# pragma mark - item.comments数据
@interface Commentinfo : NSObject

@property (nonatomic, strong) NSArray *items;

@property (nonatomic, copy) NSString *audio_comment_id;

@property (nonatomic, copy) NSString *last;

@property (nonatomic, assign) BOOL hasnext;

@end

# pragma mark - item.image_list数据
@interface Image_List : NSObject

@property (nonatomic, copy) NSString *url;

@end

# pragma mark - item.VoiceInfo数据
@interface Voiceinfo : NSObject

@property (nonatomic, copy) NSString *voice_deadline;

@property (nonatomic, copy) NSString *voice_hot_val;

@property (nonatomic, copy) NSString *voice_size;

@property (nonatomic, copy) NSString *listen_num;

@property (nonatomic, copy) NSString *voice_timelen;

@property (nonatomic, copy) NSString *voice_id;

@property (nonatomic, copy) NSString *voice_url;

@property (nonatomic, copy) NSString *user_id;

@property (nonatomic, copy) NSString *user_icon;

@property (nonatomic, copy) NSString *user_name;

@property (nonatomic, copy) NSString *publish_time;

@end
