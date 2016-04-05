//
//  MyApiLunTan.m
//  LittleGaEnglish
//
//  Created by Jed on 16/3/26.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "MyApiLunTan.h"
#import "EngineManager.h"
#import "MP3Player.h"

@interface MyApiLunTan ()
@property (nonatomic, strong) MP3Player *mp3;
@end

@implementation MyApiLunTan

+ (instancetype)share
{
    return [[MyApiLunTan alloc]init];
}

// 论坛首页
- (void)getBBSIndexDataSuccess:(void(^)(MyApiLunTan * request , LunTanMainModel * model))success
                       Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure
{

    
    NSDictionary *dic = @{};
    [self postWithUrl:k_url_bbsIndex params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            LunTanMainModel *model = [[LunTanMainModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self,model);
                return;
            }
            if(!errmsg || [errmsg isEqualToString:@""]){
                errmsg = @"服务器数据错误";
            }
            NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
            failure(self,error);
        }
        
    } failure:^(NSError *error) {
        failure(self,error);
    }];
}


// 帖子列表接口
- (void)getThreadListDataID:(NSString *)weibo_id
                     digest:(BOOL)digest
                      order:(NSString *)order
                       page:(NSString *)page
                    Success:(void(^)(MyApiLunTan * request , LunTanListModel * model))success
                    Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure
{
    NSDictionary *dic;
    if (weibo_id != nil) {
        dic = @{@"weiba_id":weibo_id,
                @"digest":[NSString stringWithFormat:@"%d",digest],
                @"order":order,
                @"Page":page};
    } else {
        dic = @{@"digest":[NSString stringWithFormat:@"%d",digest],
                @"order":order,
                @"Page":page};
    }
    
    [self postWithUrl:k_url_threadList params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            LunTanListModel *model = [[LunTanListModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self,model);
                return;
            }
            if(!errmsg || [errmsg isEqualToString:@""]){
                errmsg = @"服务器数据错误";
            }
            NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
            failure(self,error);
        }
        
    } failure:^(NSError *error) {
        failure(self,error);
    }];
}

// 签到接口
- (void)singSuccess:(void(^)(MyApiLunTan * request, NSString *signDate))success
            Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure
{
    NSDictionary *dic = @{};
    [self postWithUrl:k_url_sign params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            BaseModel *model = [[BaseModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self, json[@"lxSignDay"]);
                return;
            }
            
            if(!errmsg || [errmsg isEqualToString:@""]){
                errmsg = @"服务器数据错误";
            }
            NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
            failure(self,error);
        }
        
    } failure:^(NSError *error) {
        failure(self,error);
    }];
}


// 话题列表
- (void)getHuaTiListSuccess:(void(^)(MyApiLunTan * request, NSMutableArray *array))success
                    Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure
{
    NSDictionary *dic = @{};
    [self postWithUrl:k_url_topicList params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            HuaTiListModel *model = [[HuaTiListModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self, model.list);
                return;
            }
            
            if(!errmsg || [errmsg isEqualToString:@""]){
                errmsg = @"服务器数据错误";
            }
            NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
            failure(self,error);
        }
        
    } failure:^(NSError *error) {
        failure(self,error);
    }];
}

// 微吧列表
- (void)getWeiBaListSuccess:(void(^)(MyApiLunTan * request, NSMutableArray *array))success
                    Failure:(void(^)(MyApiLunTan * request ,NSError *requestError))failure
{
    NSDictionary *dic = @{};
    [self postWithUrl:k_url_forumList params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            NSLog(@"json : %@",json);
            WeiBaListModel *model = [[WeiBaListModel new]initWithDictionary:json error:nil];
            errmsg = model.info;
            if (model.status == 1) {
                success(self, model.list);
                return;
            }
            if(!errmsg || [errmsg isEqualToString:@""]){
                errmsg = @"服务器数据错误";
            }
            NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
            failure(self,error);
        }
        
    } failure:^(NSError *error) {
        failure(self,error);
    }];
}

- (void)sendRequestOpenNewShopOnlineWithPicture:(UIImage *)picture Success:(void (^)(MyApiLunTan *, ImageModel *))success Failure:(void (^)(MyApiLunTan *, NSError *))failur
{
    if (!picture) {
        NSError * error = [[NSError alloc]initWithDomain:@"图片上传失败，请重新选取！" code:0 userInfo:nil];
        failur(self,error);
        return;
    }

    UIImage *myImage = [UIImage yasuoImage:picture];
    NSDictionary * dic = @{};
    
    [super uploadFileWithUrl:k_url_imageupLoad params:dic image:myImage success:^(id json) {
        
        NSString * errmsg = @"";
        if (json) {
            ImageModel * responseModel = [[ImageModel alloc]initWithDictionary:json error:nil];
            errmsg = responseModel.info;
            if (responseModel.status == 1) {
                success(self,responseModel);
                return;
            }
        }
        if(!errmsg || [errmsg isEqualToString:@""]){
            errmsg = @"连接网络失败，请检查网络状态！";
        }
        NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
        failur(self,error);
        
    } failure:^(NSError *error) {
        failur(self,error);
    } Progress:^(long long totalBytesWritten, long long totalBytesExpectedToWrite) {
        NSLog(@"已上传 %lld, 共 %lld", totalBytesWritten , totalBytesExpectedToWrite);
    }];
}


// 上传文件
- (void)sendYuYinSuccess:(void (^)(MyApiLunTan *request, VoiceModel *model))success
                 Failure:(void (^)(MyApiLunTan *request, NSError *error))failur
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    NSString *path = [documentsDirectory stringByAppendingPathComponent:FILE_NAME_RECORDING];
    
    self.mp3 = [[MP3Player alloc]init];
    [self.mp3 playWithFile:path];

    NSString *time = [NSString TimeformatFromSeconds:self.mp3.getDuration];
    [super uploadFileWithUrl:k_url_voiceuoLoad params:@{@"time_long":time} FilePath:path success:^(id json) {
        
        NSString * errmsg = @"";
        if (json) {
            VoiceModel * responseModel = [[VoiceModel alloc]initWithDictionary:json error:nil];
            errmsg = responseModel.info;
            if (responseModel.status == 1) {
                success(self,responseModel);
                return;
            }
        }
        if(!errmsg || [errmsg isEqualToString:@""]){
            errmsg = @"连接网络失败，请检查网络状态！";
        }
        NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
        failur(self,error);
    } failure:^(NSError *error) {
        failur(self,error);
    }];

}


// 发布帖子
- (void)upThreadWithTitle:(NSString *)title
                  content:(NSString *)content
                 weiba_id:(NSString *)weiba_id
                   urlStr:(NSString *)imageUrl
                 vocie_id:(NSString *)voice_id
                flash_url:(NSString *)flash_url
                  Success:(void (^)(MyApiLunTan *request))success
                  Failure:(void (^)(MyApiLunTan *request, NSError *error))failur
{
    if (title == nil || [title isEmpty]) {
        [WDTipsView showTipsViewWithString:@"请输入标题"];
        return;
    }
    if (content == nil || [content isEmpty]) {
        [WDTipsView showTipsViewWithString:@"请输入正文"];
        return;
    }
    if (weiba_id == nil || [weiba_id isEmpty]) {
        [WDTipsView showTipsViewWithString:@"请选择所属微吧"];
        return;
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:title forKey:@"title"];
    [dic setValue:content forKey:@"content"];
    [dic setValue:weiba_id forKey:@"weiba_id"];
    
    if (imageUrl != nil && ! [imageUrl isEmpty]) {
        [dic setValue:imageUrl forKey:@"urlstr"];
    }

    if (voice_id != nil && ! [voice_id isEmpty]) {
        [dic setValue:voice_id forKey:@"voice_id"];
    }
    if (flash_url != nil && ! [flash_url isEmpty]) {
        [dic setValue:flash_url forKey:@"flash_url"];
    }
    
    [super postWithUrl:k_url_postThread params:dic success:^(id json) {
        
        NSString * errmsg = @"";
        if (json) {
            BaseModel * responseModel = [[BaseModel alloc]initWithDictionary:json error:nil];
            errmsg = responseModel.info;
            if (responseModel.status == 1) {
                success(self);
                return;
            }
        }
        if(!errmsg || [errmsg isEqualToString:@""]){
            errmsg = @"连接网络失败，请检查网络状态！";
        }
        NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
        failur(self,error);
        
    } failure:^(NSError *error) {
        failur(self,error);
    }];
}


// 发布话题
- (void)upTopicWithTitle:(NSString *)title
                 content:(NSString *)content
                  urlStr:(NSString *)imageUrl
                vocie_id:(NSString *)voice_id
               flash_url:(NSString *)flash_url
                 Success:(void (^)(MyApiLunTan *request))success
                 Failure:(void (^)(MyApiLunTan *request, NSError *error))failur
{
    if (title == nil || [title isEmpty]) {
        [WDTipsView showTipsViewWithString:@"请输入标题"];
        return;
    }
    if (content == nil || [content isEmpty]) {
        [WDTipsView showTipsViewWithString:@"请输入正文"];
        return;
    }
    
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    [dic setValue:title forKey:@"title"];
    [dic setValue:content forKey:@"content"];
    
    if (imageUrl != nil && ! [imageUrl isEmpty]) {
        [dic setValue:imageUrl forKey:@"urlstr"];
    }
    
    if (voice_id != nil && ! [voice_id isEmpty]) {
        [dic setValue:voice_id forKey:@"voice_id"];
    }
    if (flash_url != nil && ! [flash_url isEmpty]) {
        [dic setValue:flash_url forKey:@"flash_url"];
    }
    
    [super postWithUrl:k_url_postTopic params:dic success:^(id json) {
        
        NSString * errmsg = @"";
        if (json) {
            BaseModel * responseModel = [[BaseModel alloc]initWithDictionary:json error:nil];
            errmsg = responseModel.info;
            if (responseModel.status == 1) {
                success(self);
                return;
            }
        }
        if(!errmsg || [errmsg isEqualToString:@""]){
            errmsg = @"连接网络失败，请检查网络状态！";
        }
        NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
        failur(self,error);
        
    } failure:^(NSError *error) {
        failur(self,error);
    }];

}

// 帖子内容页
- (void)getThreadDetailWithThread_id:(NSString *)thread_id
                                page:(NSString *)page
                             Success:(void (^)(MyApiLunTan *request, ThreadDetailModel *model))success
                             Failure:(void (^)(MyApiLunTan *request, NSError *error))failur
{
    if ( thread_id == nil || [thread_id isEmpty]) {
        [WDTipsView showTipsViewWithString:@"数据错误"];
        return;
    }
    
    NSDictionary *dic = @{@"thread_id": thread_id,
                          @"page":page};
    
    
    [super postWithUrl:k_url_threadShow params:dic success:^(id json) {
        
        NSString * errmsg = @"";
        if (json) {
            ThreadDetailModel * responseModel = [[ThreadDetailModel alloc]initWithDictionary:json error:nil];
            errmsg = responseModel.info;
            if (responseModel.status == 1) {
                success(self, responseModel);
                return;
            }
        }
        if(!errmsg || [errmsg isEqualToString:@""]){
            errmsg = @"连接网络失败，请检查网络状态！";
        }
        NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
        failur(self,error);
        
    } failure:^(NSError *error) {
        failur(self,error);
    }];
}

// 话题内容页
- (void)getTopicDetailWithTopic_id:(NSString *)topic_id
                              page:(NSString *)page
                           Success:(void (^)(MyApiLunTan *request, TopicDetaiInfoModel *model))success
                           Failure:(void (^)(MyApiLunTan *request, NSError *error))failur
{
    if ( topic_id == nil || [topic_id isEmpty]) {
        [WDTipsView showTipsViewWithString:@"数据错误"];
        return;
    }
    
    NSDictionary *dic = @{@"topic_id": topic_id,
                          @"page":page};
    
    
    [super postWithUrl:k_url_topicShow params:dic success:^(id json) {
        
        NSString * errmsg = @"";
        if (json) {
            TopicDetaiInfoModel * responseModel = [[TopicDetaiInfoModel alloc]initWithDictionary:json error:nil];
            errmsg = responseModel.info;
            if (responseModel.status == 1) {
                success(self, responseModel);
                return;
            }
        }
        if(!errmsg || [errmsg isEqualToString:@""]){
            errmsg = @"连接网络失败，请检查网络状态！";
        }
        NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
        failur(self,error);
        
    } failure:^(NSError *error) {
        failur(self,error);
    }];
}


// 帖子点赞
- (void)dianzanThreadWithPost_id:(NSString *)post_id
                         Success:(void (^)(MyApiLunTan *request))success
                         Failure:(void (^)(MyApiLunTan *request, NSError *error))failur
{
    if (post_id == nil || [post_id isEmpty]) {
        [WDTipsView showTipsViewWithString:@"点赞失败"];
        return;
    }
    NSDictionary *dic = @{@"post_id": post_id};
    
    [super postWithUrl:k_url_digThread params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            BaseModel * responseModel = [[BaseModel alloc]initWithDictionary:json error:nil];
            errmsg = responseModel.info;
            if (responseModel.status == 1) {
                success(self);
                return;
            }
        }
        if(!errmsg || [errmsg isEqualToString:@""]){
            errmsg = @"连接网络失败，请检查网络状态！";
        }
        NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
        failur(self,error);
        
    } failure:^(NSError *error) {
        failur(self,error);
    }];
}

// 帖子收藏
- (void)favThreadWithPost_id:(NSString *)post_id
                     Success:(void (^)(MyApiLunTan *request))success
                     Failure:(void (^)(MyApiLunTan *request, NSError *error))failur
{
    if (post_id == nil || [post_id isEmpty]) {
        [WDTipsView showTipsViewWithString:@"收藏失败"];
        return;
    }
    NSDictionary *dic = @{@"post_id": post_id};
    
    [super postWithUrl:k_url_favThread params:dic success:^(id json) {
        NSString * errmsg = @"";
        if (json) {
            BaseModel * responseModel = [[BaseModel alloc]initWithDictionary:json error:nil];
            errmsg = responseModel.info;
            if (responseModel.status == 1) {
                success(self);
                return;
            }
        }
        if(!errmsg || [errmsg isEqualToString:@""]){
            errmsg = @"连接网络失败，请检查网络状态！";
        }
        NSError * error = [[NSError alloc]initWithDomain:errmsg code:0 userInfo:nil];
        failur(self,error);
        
    } failure:^(NSError *error) {
        failur(self,error);
    }];
}

@end
