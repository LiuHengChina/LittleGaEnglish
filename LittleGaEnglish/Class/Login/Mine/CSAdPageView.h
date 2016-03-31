
//
//  CSAdPageView.h
//  CSAdPageView
//
//
//  广告滚动视图
//

#import <UIKit/UIKit.h>

@protocol CSAdPageViewDelegate <NSObject>
- (void)didSelectPageViewIndex:(NSInteger)index;
@end

@interface CSAdPageView : UIView
@property(nonatomic,weak)id<CSAdPageViewDelegate> delegate;
- (void)setAds:(NSArray*)imgNameArr;
@end
