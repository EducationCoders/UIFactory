//
//  ThemeManager.h
//  SwizzlingTest
//
//  Created by Yashodhan Gokhale on 24/02/16.
//  Copyright © 2016 YO Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    YOThemeStyleCircle = 0,
    YOThemeStyleSquare,
    YOThemeStylePriceTag,
} YOThemeStyle;

@class ThemeManager;

@interface ThemeManager : NSObject

@property (nonatomic,retain) NSMutableDictionary* stylesMasterList;

+(ThemeManager*)sharedManager;
-(NSDictionary*) getStyleObjectForStyleType:(YOThemeStyle)themeStyle;

@end
