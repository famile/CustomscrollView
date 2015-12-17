//
//  Common.h
//  YXLDisplayListView
//
//  Created by 叶星龙 on 15/6/1.
//  Copyright (c) 2015年 叶星龙. All rights reserved.
//


/*******************/
// 顶部滚动视图的高度
//#define kTopScrollH 40
//
////设置按钮显示区域多少个
//#define kBtnWInt 4
//
//// 分类按钮的宽度
//#define kBtnW kWindowWidth/kBtnWInt
//// 分类按钮的间距
//#define kMargin (kWindowWidth-kBtnW*kBtnWInt)/kBtnWInt
//
//// 分类按钮的高度
//#define kBtnH 40




// 屏幕大小
#define kScreenBounds [[UIScreen                          mainScreen]bounds]
#define kWindowWidth  ([[UIScreen mainScreen]             bounds].size.width)
#define kWindowHeight ([[UIScreen mainScreen]             bounds].size.height)

#ifndef CGWidth
#define CGWidth(rect)                   rect.size.width
#endif

#ifndef CGHeight
#define CGHeight(rect)                  rect.size.height
#endif

#ifndef CGOriginX
#define CGOriginX(rect)                 rect.origin.x
#endif

#ifndef CGOriginY
#define CGOriginY(rect)                 rect.origin.y
#endif


//选中中了分类按钮的通知
#define kProductClassBtnSelectedNote @"ProductClassSelected"

// 底部滚动视图滚动
#define kBottomScrollViewDidScroll @"scrollViewDidScroll"

// 当前选中角标
#define kSelectedIndexKey @"selectedIndex"

// 底部滚动视图停止滚动
#define kBottomScrollViewDidEndDecelerating @"scrollViewDidEndDecelerating"


// 底部滚动的区域
#define kBottomContentoffsetX @"bottomContentoffsetX"

#define BAPopViewControllerNotification @"popToVC"

//字体数字
#define FontInt 16
// 选择卡字体
#define kTabItemFont [UIFont systemFontOfSize:FontInt]
/**************/

// 细字体
#define Font(F)                 [UIFont systemFontOfSize:(F)]
// 粗字体
#define boldFont(F)             [UIFont boldSystemFontOfSize:(F)]
// 标准的RGBA设置
#define UIColorRGBA(r, g, b, a) [UIColor colorWithRed:(r)/255.0 green:(g)/255.0 blue:(b)/255.0 alpha:(a)]
// 十六进制色值
#define UIColorFromRGB_HEX(rgbValue)        [UIColor colorWithRed:((float)((rgbValue & 0xFF0000) >> 16))/255.0 green:((float)((rgbValue & 0xFF00) >> 8))/255.0 blue:((float)(rgbValue & 0xFF))/255.0 alpha:1.0]
// 十六进制色值加透明度
#define UIColorFromRGBA_HEX(rgbV,alphaV)    [UIColor colorWithRed:((float)((rgbV & 0xFF0000) >> 16))/255.0 green:((float)((rgbV & 0xFF00) >> 8))/255.0 blue:((float)(rgbV & 0xFF))/255.0 alpha:alphaV]

#define HEX_COLOR_THEME             UIColorFromRGB_HEX(0Xfc95ca)//主题颜色

#define HEX_COLOR_VIEW_BACKGROUND   UIColorRGBA(238, 238, 238, 1) //视图底色

