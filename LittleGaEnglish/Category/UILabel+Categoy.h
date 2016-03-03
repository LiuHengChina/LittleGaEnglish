//
//  UILabel+Categoy.h
//  heLanPai
//
//  Created by Lirui on 14/12/15.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UILabel (Categoy)


/**
*  label内容的size （text 、 attributedText）不限宽高
*
*  @return CGSize
*/
- (CGSize)sizeOfLabel;

/**
*  label内容的size
*
*  @return CGSize
*/
- (CGSize)sizeOfLabelWithSize:(CGSize)size;


/**
*  label内容的size （text 、 attributedText） 求最大高度,size可不写
*
*  @return CGSize
*/
- (CGSize)sizeOfLabelWithLabelWeightWithSize:(CGSize)size;

/**
*  label内容的size （text 、 attributedText） 求最大高度
*
*  @return CGSize
*/
- (CGSize)sizeOfLabelWithLabelWeight;

/**
*  label内容的size （text 、 attributedText） 求最大宽度,size可不写
*
*  @return CGSize
*/
- (CGSize)sizeOfLabelWithLabelHeightWithSize:(CGSize)size;

/**
*  label内容的size （text 、 attributedText） 求最大宽度
*
*  @return CGSize
*/
- (CGSize)sizeOfLabelWithLabelHeight;


@end
