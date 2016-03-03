//
//  UIImage+Category.h
//  heLanPai
//
//  Created by Lirui on 14/12/11.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Category)


//获取纯色UIImage
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;


//剪裁图片到设置的尺寸
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize;

+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size;


+ (UIImage *)A:(UIImage *)a andB:(UIImage *)b;

+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize;


@end
