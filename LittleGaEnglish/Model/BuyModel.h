//
//  BuyModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/5.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@class BuyProductModel;
@class BuyClassListModel;
@class BuyMealModel;

@interface BuyModel : BaseModel
@property (nonatomic, strong) BuyProductModel * product;
@property (nonatomic, strong) BuyMealModel *recommend_set_meal;

@end


@interface BuyProductModel : JSONModel
@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * price;
@property (nonatomic, copy) NSString * product_type;
@property (nonatomic, copy) NSString * is_can_use_coupon;
@property (nonatomic, copy) NSString * is_can_exchange_coffee_score;
@property (nonatomic, copy) NSString * user_coffee_score;
@end


@interface BuyMealModel : JSONModel

@property (nonatomic, copy) NSString * id;
@property (nonatomic, copy) NSString * name;
@property (nonatomic, copy) NSString * price;
@property (nonatomic, copy) NSString * original_price;
@property (nonatomic, copy) NSString * class_num;
@property (nonatomic, strong) NSMutableArray<BuyClassListModel *> *class_list;

@end

@interface BuyClassListModel : JSONModel

@property (nonatomic, copy) NSString * class_id;
@property (nonatomic, copy) NSString * class_name;
@property (nonatomic, copy) NSString * class_price;
@property (nonatomic, copy) NSString * class_cover_url;

@end