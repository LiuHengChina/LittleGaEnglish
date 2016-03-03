//
//  WDTipsView.m
//  GoodsDealer
//
//  Created by wufd on 30/10/15.
//  Copyright © 2015年 Ujuhui. All rights reserved.
//

#import "WDTipsView.h"
#import "Masonry.h"

@interface WDTipsView (){
//    UIView * _bgView;
//    UILabel * _tipsLabel;
}
@property (nonatomic, strong) UIView *bgView;
@property (nonatomic, strong) UILabel *tipsLabel;

@end

@implementation WDTipsView

+ (instancetype)showTipsViewWithString:(NSString *)str {
    WDTipsView * tips = [[WDTipsView alloc]init];
    UIWindow * window = [[UIApplication sharedApplication]keyWindow];
    [window addSubview:tips];
    [tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(window.mas_centerX);
        make.width.equalTo(window.mas_width);
        make.height.equalTo(@200);
        make.bottom.equalTo(window.mas_bottom).offset(-48);
    }];
    tips.backgroundColor = [UIColor clearColor];
    [tips setTipsView:str];
    [tips animation1];
    return tips;
}



+ (instancetype)showTipsViewWithString:(NSString *)str showViewHeader:(UIView *)view
{
    WDTipsView * tips = [[WDTipsView alloc]init];
    UIWindow * window = [[UIApplication sharedApplication]keyWindow];
    [window addSubview:tips];
    [tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(window.mas_centerX);
        make.width.equalTo(window.mas_width);
        make.height.equalTo(@200);
        make.bottom.equalTo(view.mas_top).offset(-20);
    }];
    tips.backgroundColor = [UIColor clearColor];
    [tips setTipsView:str];
    [tips animation1];
    return tips;
}




+ (instancetype)showTipsViewWithString:(NSString *)str textColor:(UIColor *)textColor font:(UIFont *)font viewColor:(UIColor *)viewColor
{
    WDTipsView * tips = [[WDTipsView alloc]init];
    UIWindow * window = [[UIApplication sharedApplication]keyWindow];
    
    for (UIView *view in window.subviews) {
        if ([view isKindOfClass:[WDTipsView class]]) {
            [view removeFromSuperview];
        }
    }
    
    [window addSubview:tips];
    [tips mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(window.mas_centerX);
        make.width.equalTo(window.mas_width);
//        make.height.equalTo(window.mas_height);
//        make.centerY.equalTo(window.mas_centerY);
        make.height.equalTo(@200);
        make.bottom.equalTo(window.mas_bottom).offset(-48);
    }];
    tips.backgroundColor = [UIColor clearColor];
    [tips setTipsView:str];
    [tips animation2];
    
    tips.tipsLabel.textColor = textColor;
    tips.tipsLabel.font = font;
    tips.bgView.backgroundColor = viewColor;
    [tips.bgView mas_updateConstraints:^(MASConstraintMaker *make) {
       make.bottom.equalTo(tips.mas_bottom).offset(-100-48) ;
    }];
    return tips;
}

- (void)setTipsView:(NSString *)str{
    WS(wSelf);
    _bgView = [UIView new];
    [self addSubview:_bgView];
    _bgView.layer.masksToBounds = YES;
    _bgView.layer.cornerRadius = 3;
    _bgView.alpha = 0.6;
    _bgView.backgroundColor = [UIColor blackColor];
    [_bgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(wSelf.mas_centerX);
        make.bottom.equalTo(wSelf.mas_bottom);
    }];
    
    _tipsLabel = [UILabel new];
    [_bgView addSubview:_tipsLabel];
    _tipsLabel.backgroundColor = [UIColor clearColor];
    _tipsLabel.numberOfLines = 0;
    _tipsLabel.lineBreakMode = NSLineBreakByCharWrapping;
    _tipsLabel.text = str;
    _tipsLabel.textAlignment = NSTextAlignmentCenter;
    _tipsLabel.textColor = [UIColor whiteColor];
    _tipsLabel.font = [UIFont systemFontOfSize:kFontSize_normalText];
    [_tipsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(_bgView.mas_centerX);
        make.bottom.equalTo(_bgView.mas_bottom).offset(-10);
        make.top.equalTo(_bgView.mas_top).offset(10);
        make.left.equalTo(_bgView.mas_left).offset(20);
        make.right.equalTo(_bgView.mas_right).offset(-20);
        if (kDeviceModel_iPad) {
            make.width.lessThanOrEqualTo(@360);
        }else{
            make.width.lessThanOrEqualTo(@280);
        }
    }];
    
    
    CGSize contentSize = [self calTextSizeWithString:str];
    CGFloat height = contentSize.height +20;
    _bgView.layer.cornerRadius = height/2.0;
    
//    
//    UIBezierPath *maskPath = [UIBezierPath bezierPathWithRoundedRect:_bgView.bounds byRoundingCorners:UIRectCornerTopLeft | UIRectCornerTopRight |UIRectCornerBottomLeft | UIRectCornerBottomRight cornerRadii:CGSizeMake(1, 1)];
//    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
//    maskLayer.frame = _bgView.bounds;
//    maskLayer.path = maskPath.CGPath;
//    _bgView.layer.mask = maskLayer;
    
    
//    _bgView.alpha = 0;
//    [UIView animateWithDuration:0.8 animations:^{
//        _bgView.alpha = 0.6;
//    } completion:^(BOOL finished) {
//        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [UIView animateWithDuration:0.8 animations:^{
//                _bgView.alpha = 0;
//            } completion:^(BOOL finished) {
//                _bgView.alpha = 0;
//                [wSelf removeFromSuperview];
//                
//            }];
//        });
//    }];
}

- (void)animation1 {
    WS(wself);
    _bgView.alpha = 0;
    [UIView animateWithDuration:0.8 animations:^{
        _bgView.alpha = 0.6;
    } completion:^(BOOL finished) {
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [UIView animateWithDuration:0.8 animations:^{
                _bgView.alpha = 0;
            } completion:^(BOOL finished) {
                _bgView.alpha = 0;
                [wself removeFromSuperview];
                
            }];
        });
    }];
}

- (void)animation2 {
    _bgView.alpha = 1;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self removeFromSuperview];
    });
}

- (CGSize)calTextSizeWithString:(NSString *)str {
    CGFloat maxWidth = 280;
    if (kDeviceModel_iPad) {
        maxWidth = 360;
    }
    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment = NSTextAlignmentCenter;
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont systemFontOfSize:kFontSize_normalText], NSParagraphStyleAttributeName : paragraphStyle};
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:str];
    NSRange range;
    range.location = 0;
    range.length = attrStr.length;
    [attrStr addAttributes:attributes range:range];
    CGSize contentSize = [attrStr boundingRectWithSize:CGSizeMake(maxWidth, MAXFLOAT) options:(NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading) context:nil].size;
    return contentSize;
}


@end
