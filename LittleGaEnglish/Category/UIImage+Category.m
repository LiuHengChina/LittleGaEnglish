//
//  UIImage+Category.m
//  heLanPai
//
//  Created by Lirui on 14/12/11.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import "UIImage+Category.h"

@implementation UIImage (Category)


+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size {

    @autoreleasepool {

        CGRect rect = CGRectMake(0, 0, size.width, size.height);

        UIGraphicsBeginImageContext(rect.size);

        CGContextRef context = UIGraphicsGetCurrentContext();

        CGContextSetFillColorWithColor(context, color.CGColor);

        CGContextFillRect(context, rect);

        UIImage *img = UIGraphicsGetImageFromCurrentImageContext();

        UIGraphicsEndImageContext();


        return img;

    }

}


//剪裁图片到设置的尺寸
+ (UIImage *)imageWithImage:(UIImage *)image scaledToSize:(CGSize)newSize {
    //    创建一个图形上下文形象
    UIGraphicsBeginImageContext(newSize);

    //    告诉旧图片画在这个新的环境
    [image drawInRect:CGRectMake(0, 0, newSize.width, newSize.height)];
    //    image drawInRect:<#(CGRect)#> blendMode:<#(CGBlendMode)#> alpha:<#(CGFloat)#>

    //    从上下文的新形象
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();

    //    结束的上下文
    UIGraphicsEndImageContext();

    //返回新图
    return newImage;
}


+ (UIImage *)scaleToSize:(UIImage *)img size:(CGSize)size {
    // 创建一个bitmap的context
    // 并把它设置成为当前正在使用的context
    UIGraphicsBeginImageContext(size);
    // 绘制改变大小的图片
    [img drawInRect:CGRectMake(0, 0, size.width, size.height)];
    // 从当前context中创建一个改变大小后的图片
    UIImage *scaledImage = UIGraphicsGetImageFromCurrentImageContext();
    // 使当前的context出堆栈
    UIGraphicsEndImageContext();
    // 返回新的改变大小后的图片
    return scaledImage;
}


+ (UIImage *)A:(UIImage *)a andB:(UIImage *)b {

    CGSize finalSize = [a size];
    CGSize hatSize = [b size];
    UIGraphicsBeginImageContext(finalSize);
    [a drawInRect:CGRectMake(0, 0, finalSize.width, finalSize.height)];
    [b drawInRect:CGRectMake(0, 0, hatSize.width, hatSize.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;

}


+ (UIImage *)reSizeImage:(UIImage *)image toSize:(CGSize)reSize {
    UIGraphicsBeginImageContext(CGSizeMake(reSize.width, reSize.height));
    [image drawInRect:CGRectMake(0, 0, reSize.width, reSize.height)];
    UIImage *reSizeImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return reSizeImage;
}


@end
