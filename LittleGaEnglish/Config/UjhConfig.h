#import <Availability.h>

#ifndef __IPHONE_3_0
#warning "This project uses features only available in iOS SDK 3.0 and later."
#endif

#ifdef __OBJC__

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import <Security/Security.h>
#import "MyConstantKey.h"
#import "EnumValue.h"
#import "MyCategory.h"

#endif

#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define kiOSVersion_iOS7 (kSYSTEMNAME_AND_VERSION>=7.0&&kSYSTEMNAME_AND_VERSION<8.0)
#define kDeviceModel_iPad (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad)

#define kSYSTEMNAME_AND_VERSION ([[[UIDevice currentDevice]systemVersion] floatValue])
#define kSYSTEM_SCREEN_HEIGHT ([[UIScreen mainScreen] bounds].size.height)
#define kSYSTEM_SCREEN_WEIGHT ([[UIScreen mainScreen] bounds].size.width)
//定义block self
#define WeakSelf(_wSelf) __weak __typeof(&*self)_wSelf = self;
#define WS(weakSelf) WeakSelf(weakSelf)

//去release log
#ifdef DEBUG
#else
#define NSLog(...){};
#endif

//预购商品view的高度
#define PreViewH (130 + 10)
#define KScaleConst 1
//#define PreViewH (kSYSTEM_SCREEN_WEIGHT*13/32 + 10)
//#define KScaleConst KScreenWidth/320

#define WordFont (KScreenWidth > 375?1.0:1.0)
#define KScale KScreenWidth/320.0f

#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

#define KScreenWidth [UIScreen mainScreen].bounds.size.width
#define KScreenHeight [UIScreen mainScreen].bounds.size.height

typedef void (^VoidBlcok)(void);

#define kConstFontSize_9 9.0f
#define kConstFontSize_10 10.0f
#define kConstFontSize_12 12.0f
#define kConstFontSize_13 13.0f
#define kConstFontSize_15 15.0f
#define kConstFontSize_16 16.0f
#define kConstFontSize_18 18.0f
#define kConstFontSize_21 21.0f
#define kConstFontSize_24 24.0f
#define kConstFontSize_30 30.0f
#define kConstFontSize_36 36.0f

#define kFontSize_Item kConstFontSize_10 /**> 标签图标文字字号 */

#define kFontSize_ConstSmall kConstFontSize_13 /**> 常用小字号 主要说明性、附加性 */
#define kFontSize_normalText kConstFontSize_15 /**> 常用主字号 主要正文、常规按钮 */

#define kFontSize_navTitle kConstFontSize_18 /**> APP导航title字体大小 */
#define kFontSize_NavItemBtn kConstFontSize_16 /**> APP导航 Item的btn字号 */

#define kFontSize_ViewTitle kConstFontSize_18 /**> APP导航title字体大小 */

#define kFontSize_Strong21 kConstFontSize_24 /**> 少数强调场景 */
#define kFontSize_Strong30 kConstFontSize_30 /**> 着重强调字号 */


/*****************************************************************************/
#ifdef kDeviceModel_iPad//ipad设备

#else

#endif
