//
//  EnumValue.h
//  fast
//
//  Created by lirui on 7/2/15.
//  Copyright (c) 2015年 ujuhui. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UjhConfig.h"

//支付方式
typedef NS_ENUM(NSInteger, PayType) {
    PayTypeNone         = 0,
    PayTypeZhiFuBao     = 1,
    PayTypeWeiXin       = 2,
    PayTypeHuoDaoFuKuan = 3,
    PayTypeBaiDuZhiDa   = 4,
    PayTypeXianJinShouKuan = 5
};

//滑动方向  用于left_menu
typedef NS_ENUM(NSInteger, PanDirection) {
    PanDirectionNone  = 0,
    PanDirectionLeft  = 1,
    PanDirectionRight = 2
};


//用于分享类型
typedef NS_ENUM(NSInteger, MyShareType) {
    MyShareTypeNone       = 0,
    MyShareTypeWxSession  = 1,//微信对话分享
    MyShareTypeWxTimeline = 2,//微信朋友圈分享
    //微信收藏
    MyShareTypeQQ         = 4,//QQ分享
    MyShareTypeQQSpace    = 5,//QQ空间分享
    MyShareTypeWeibo      = 6,//微博分享
    MyShareTypePhoneSms   = 7,//手机短信分享
};

typedef NS_ENUM(NSInteger, MyShareContentType) {
    MyShareContentTypeNone          = 0,
    MyShareContentTypeDefault       = 1,//默认，文字
    MyShareContentTypeImage         = 2,//图片分享
};


//订单收获方式
typedef NS_ENUM(NSInteger, OrderReceiveType) {
    OrderReceiveTypeNone       = 0,
    OrderReceiveTypeDelivery   = 1,//送货上门
    OrderReceiveTypeSelfPickUp = 2,//自取
};

//活动类型
typedef NS_ENUM(NSInteger, ActivityType) {
    ActivityTypeNormal    = 0,//普通活动
    ActivityTypePromotion = 1,//促销活动
    ActivityTypeSchedule  = 2,//预购活动
};

//活动类型
typedef NS_ENUM(NSInteger, CartHidden) {
    CartHiddenNO  = 0,//显示购物车
    CartHiddenYES = 1,//不显示购物车
};

//订单状态
typedef NS_ENUM(NSInteger, OrderStatusType) {
    OrderStatusTypeNone = 0,
    OrderStatusTypeNew,
    OrderStatusTypeWaitting,
    OrderStatusTypeSending,
    OrderStatusTypeHasReceive,
    OrderStatusTypeFail,
    OrderStatusTypeCancelled,
    
    
    OrderStatusTypeSupplierStock,//供货商 备货中
    OrderStatusTypeSupplierDelivery,//供货商 发货中
    OrderStatusTypeSendEnd,//已送达
    
    OrderStatusTypeWaitPay,
    OrderStatusTypeIsActivity,//此推送为活动推送
    OrderStatusTypeConfirm
};

//配送状态
typedef NS_ENUM(NSInteger, OrderSendStatusType) {
    OrderSendStatusTypeNone      = 0,//无
    OrderSendStatusTypeDefault, //商家自己配送
    OrderSendStatusTypeDadaWait,//达达等待中
    OrderSendStatusTypeDadaOngoing,//取货，送货中，及送货完
};


//本地添加，判断order状态
typedef enum : NSUInteger {
    isEmptyOrderTypeNone            = 0,//默认
    isEmptyOrderTypeEmptyForID      = 2,//只有id
    isEmptyOrderTypeEmptyForOrther  = 4,
} isEmptyOrderType;


/**< 获取验证码的enum */
typedef NS_ENUM(NSUInteger, WDRequestPhoneMsgType) {
    PhoneMsgTypeNone        = 0,
    PhoneMsgTypeResetPsw    = 1,
    PhoneMsgTypeOpen        = 2,
    PhoneMsgTypeCreate      = 3,
};
