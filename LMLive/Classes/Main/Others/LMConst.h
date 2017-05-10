



/**
 *  颜色
 */
#define LMBlackColor [UIColor blackColor]
#define LMBlueColor [UIColor blueColor]
#define LMRedColor [UIColor redColor]
#define LMWhiteColor [UIColor whiteColor]
#define LMGrayColor [UIColor grayColor]
#define LMDarkGrayColor [UIColor darkGrayColor]
#define LMLightGrayColor [UIColor lightGrayColor]
#define LMGreenColor [UIColor greenColor]
#define LMCyanColor [UIColor cyanColor]
#define LMYellowColor [UIColor yellowColor]
#define LMMagentaColor [UIColor magentaColor]
#define LMOrangeColor [UIColor orangeColor]
#define LMPurpleColor [UIColor purpleColor]
#define LMBrownColor [UIColor brownColor]
#define LMClearColor [UIColor clearColor]


/** RGB颜色 */
#define LMColor_RGB(r, g, b) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:1.0]
#define LMColor_RGBA(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a)]
#define LMColor_RGBA_256(r, g, b, a) [UIColor colorWithRed:(r) / 255.0 green:(g) / 255.0 blue:(b) / 255.0 alpha:(a) / 255.0]
/** 随机色 */
#define LMRandomColor_RGB YPColor_RGB(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))
#define LMRandomColor_RGBA YPColor_RGBA_256(arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256), arc4random_uniform(256))

/** 弧度制转为角度制 */
#define LMAngle2Radian(angle) ((angle) / 180.0 * M_PI)




/** 系统状态栏高度 */
UIKIT_EXTERN CGFloat const kAppStatusBarHeight;
/** 系统导航栏高度 */
UIKIT_EXTERN CGFloat const kAppNavigationBarHeight;
/** 系统tabbar高度 */
UIKIT_EXTERN CGFloat const kAppTabBarHeight;

/** 系统间距字段 8 */
UIKIT_EXTERN CGFloat const kAppPadding_8;
/** 系统间距字段 12 */
UIKIT_EXTERN CGFloat const kAppPadding_12;
/** 系统间距字段 16 */
UIKIT_EXTERN CGFloat const kAppPadding_16;
/** 系统间距字段 20 */
UIKIT_EXTERN CGFloat const kAppPadding_20;
/** 系统间距字段 24 */
UIKIT_EXTERN CGFloat const kAppPadding_24;
/** 系统间距字段 28 */
UIKIT_EXTERN CGFloat const kAppPadding_28;
/** 系统间距字段 32 */
UIKIT_EXTERN CGFloat const kAppPadding_32;
