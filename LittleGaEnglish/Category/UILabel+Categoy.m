//
//  UILabel+Categoy.m
//  heLanPai
//
//  Created by Lirui on 14/12/15.
//  Copyright (c) 2014年 ujuhui. All rights reserved.
//

#import "UILabel+Categoy.h"

@implementation UILabel (Categoy)

/**
*  label内容的size （text 、 attributedText）不限宽高
*
*  @return CGSize
*/
- (CGSize)sizeOfLabel {

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;

    NSDictionary *attributes = @{NSFontAttributeName : self.font,
            NSParagraphStyleAttributeName : paragraphStyle};

    if (!self.attributedText && self.text) {
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text];
    }
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSRange range;
    range.location = 0;
    range.length = attrStr.length;
    [attrStr addAttributes:attributes range:range];

    CGSize contentSize = contentSize = [attrStr boundingRectWithSize:CGSizeMake(MAXFLOAT, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;

    return contentSize;
}

- (CGSize)sizeOfLabelWithSize:(CGSize)size {

    CGSize maxSize = CGSizeZero;
    if ((size.width == 0) && (size.height == 0)) {
        maxSize = CGSizeMake(MAXFLOAT, MAXFLOAT);
    } else {
        maxSize = size;
    }

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;

    NSDictionary *attributes = @{NSFontAttributeName : self.font,
            NSParagraphStyleAttributeName : paragraphStyle};

    if (!self.attributedText && self.text) {
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text];
    }
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];
    NSRange range;
    range.location = 0;
    range.length = attrStr.length;
    [attrStr addAttributes:attributes range:range];

    CGSize contentSize = contentSize = [attrStr boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;

    return contentSize;
}


/**
*  label内容的size （text 、 attributedText） 求最大宽度限制，限高不限宽
*
*  @return CGSize
*/
- (CGSize)sizeOfLabelWithLabelWeightWithSize:(CGSize)size {

    CGSize maxSize = CGSizeZero;
    if ((size.width == 0) && (size.height == 0)) {
        maxSize = CGSizeMake(self.frame.size.width, MAXFLOAT);
    } else {
        maxSize = size;
    }

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;

    NSDictionary *attributes = @{NSFontAttributeName : self.font,
            NSParagraphStyleAttributeName : paragraphStyle};

    if (!self.attributedText && self.text) {
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text];
    }

    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];

    NSRange range;
    range.location = 0;
    range.length = attrStr.length;
    [attrStr addAttributes:attributes range:range];

    CGSize contentSize = [attrStr boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;

    return contentSize;
}

- (CGSize)sizeOfLabelWithLabelWeight {

    CGSize maxSize = CGSizeMake(self.frame.size.width, MAXFLOAT);

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;

    NSDictionary *attributes = @{NSFontAttributeName : self.font,
            NSParagraphStyleAttributeName : paragraphStyle};

    if (!self.attributedText && self.text) {
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text];
    }

    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];

    NSRange range;
    range.location = 0;
    range.length = attrStr.length;
    [attrStr addAttributes:attributes range:range];

    CGSize contentSize = [attrStr boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;

    return contentSize;
}


/**
*  label内容的size （text 、 attributedText） 求最大宽度
*
*  @return CGSize
*/
- (CGSize)sizeOfLabelWithLabelHeightWithSize:(CGSize)size {

    CGSize maxSize = CGSizeZero;
    if ((size.width == 0) && (size.height == 0)) {
        maxSize = CGSizeMake(MAXFLOAT, self.frame.size.height);
    } else {
        maxSize = size;
    }

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;

    NSDictionary *attributes = @{NSFontAttributeName : self.font,
            NSParagraphStyleAttributeName : paragraphStyle};

    if (!self.attributedText && self.text) {
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text];
    }

    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];

    NSRange range;
    range.location = 0;
    range.length = attrStr.length;
    [attrStr addAttributes:attributes range:range];

    CGSize contentSize = [attrStr boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;

    return contentSize;
}

- (CGSize)sizeOfLabelWithLabelHeight {

    CGSize maxSize = CGSizeMake(MAXFLOAT, self.frame.size.height);

    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = self.lineBreakMode;
    paragraphStyle.alignment = self.textAlignment;

    NSDictionary *attributes = @{NSFontAttributeName : self.font,
            NSParagraphStyleAttributeName : paragraphStyle};

    if (!self.attributedText && self.text) {
        self.attributedText = [[NSAttributedString alloc] initWithString:self.text];
    }

    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithAttributedString:self.attributedText];

    NSRange range;
    range.location = 0;
    range.length = attrStr.length;
    [attrStr addAttributes:attributes range:range];

    CGSize contentSize = [attrStr boundingRectWithSize:maxSize options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;

    return contentSize;
}

@end
