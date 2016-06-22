//
//  ThemeManager.m
//  SwizzlingTest
//
//  Created by Yashodhan Gokhale on 24/02/16.
//  Copyright © 2016 YO Pvt Ltd. All rights reserved.
//

#import "ThemeManager.h"
#import "ESCssParser.h"

@implementation ThemeManager

+(ThemeManager*)sharedManager
{
    static ThemeManager* gThemeManager = nil;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        gThemeManager = [[ThemeManager alloc] init];
        [gThemeManager initialize];
    });
    
    return gThemeManager;
}

-(void) initialize
{
    self.stylesMasterList = [[NSMutableDictionary alloc] init];
    ESCssParser* parser = [[ESCssParser alloc] init];
    
    NSURL* cssUrl = [[NSBundle mainBundle] URLForResource:@"YOTest" withExtension:@".css"];
    NSString* strCss = [NSString stringWithContentsOfURL:cssUrl encoding:NSUTF8StringEncoding error:nil];
    self.stylesMasterList = [[parser parseText:strCss] mutableCopy];
}

-(NSDictionary*) getStyleObjectForStyleType:(YOThemeStyle)themeStyle
{
    return nil;
}

@end
