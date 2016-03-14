//
//  MineModel.h
//  LittleGaEnglish
//
//  Created by Jed on 16/3/12.
//  Copyright © 2016年 Jed. All rights reserved.
//

#import "BaseModel.h"

@interface MineModel : BaseModel


//portrait: "http://app.xiaokaen.com/addons/theme/stv1/_static/image/noavatar/middle.jpg",
//uname: "磊",
//gradeLevel: 1,
//gradeName: "LV1",
//gradeImage: "72",
//isVip: "0",
//courseNumber: "0",
//postNumber: "0",
//enshrineNumber: "0",
//fansNumber: "0"

@property (nonatomic, copy) NSString *portrait;
@property (nonatomic, copy) NSString *uname;
@property (nonatomic, copy) NSString *gradeLevel;
@property (nonatomic, copy) NSString *gradeName;
@property (nonatomic, copy) NSString *gradeImage;
@property (nonatomic, copy) NSString *isVip;
@property (nonatomic, copy) NSString *courseNumber;
@property (nonatomic, copy) NSString *postNumber;
@property (nonatomic, copy) NSString *enshrineNumber;
@property (nonatomic, copy) NSString *fansNumber;

@end
