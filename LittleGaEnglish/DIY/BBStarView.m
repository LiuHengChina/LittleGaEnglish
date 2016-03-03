//
//  BBStarView.m
//  MoveStar
//
//  Created by Jed on 16/2/29.
//  Copyright © 2016年 yang. All rights reserved.
//

#import "BBStarView.h"

@interface BBStarView ()

@property (nonatomic, strong) NSMutableArray *imgArr;
@property (nonatomic, assign) BOOL canAddStar;

@end

@implementation BBStarView



- (instancetype)init
{
    self = [super init];
    if (self) {
        [self addAllViews];
    }
    return self;
}

- (void)awakeFromNib
{
    [self addAllViews];
}

- (void)setCanEdit:(BOOL)canEdit
{
    _canEdit = canEdit;
    self.userInteractionEnabled = _canEdit;
}

- (void)addAllViews
{
    self.imgArr = [NSMutableArray array];
    UIView *lastView;
    for (int i = 0; i < 5; i++) {
        UIImageView *image = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"StarUnSelect"]];
        [self addSubview:image];
        [image mas_makeConstraints:^(MASConstraintMaker *make) {
            if (lastView) {
                make.left.equalTo(lastView.mas_right).offset(10);
            } else {
                make.left.equalTo(@0);
            }
            make.top.equalTo(@0);
            make.bottom.equalTo(@0);
            make.width.equalTo(self.mas_height);
        }];
        lastView = image;
        [self.imgArr addObject:image];
    }
    self.count = 1;
}

- (void)setCount:(NSInteger)count
{
    if (count > 5) {
        _count = 5;
    }
    if (count < 1) {
        _count = 1;
    }
    _count = count;
    int i = 0;
    for (i = 0; i < _count; i++) {
        UIImageView *img = self.imgArr[i];
        img.image = [UIImage imageNamed:@"StarSelected"];
    }
    for (; i < self.imgArr.count; i++) {
        UIImageView *img = self.imgArr[i];
        img.image = [UIImage imageNamed:@"StarUnSelect"];
    }
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    UITouch *touch = [touches anyObject];
    CGPoint point = [touch locationInView:self];
    if((point.x>0 && point.x<self.frame.size.width)&&(point.y>0 && point.y<self.frame.size.height)){
        self.canAddStar = YES;
        [self changeStarForegroundViewWithPoint:point];
        
    }else{
        self.canAddStar = NO;
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    
    if(self.canAddStar){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        [self changeStarForegroundViewWithPoint:point];
        
    }
    
    
    return;
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    if(self.canAddStar){
        UITouch *touch = [touches anyObject];
        CGPoint point = [touch locationInView:self];
        [self changeStarForegroundViewWithPoint:point];
        
    }
    
    self.canAddStar = NO;
    return;
}


-(void)changeStarForegroundViewWithPoint:(CGPoint)point{
    
    NSInteger count = 0;
    for (int i = 0; i < self.imgArr.count; i ++) {
        count = count + [self changeImg:point.x image:self.imgArr[i]];
    }

    self.count = count;
   
    if (self.delegate && [self.delegate respondsToSelector:@selector(starViewChangeCount:)]) {
        [self.delegate starViewChangeCount:self.count];
    }
}


-(NSInteger)changeImg:(float)x image:(UIImageView*)img{
    if(x> img.frame.origin.x){
        return 1;
    }else{
        return 0;
    }
}






/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
