//
//  SwizzlingHelper.h
//  YOAutoSkinner
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject(SwizzlingHelper)

+ (BOOL) swizzleMethod:(SEL)origSel_ withMethod:(SEL)altSel_ error:(NSError**)error;
+ (BOOL) swizzleClassMethod:(SEL)origSel_ withClassMethod:(SEL)altSel_ error:(NSError**)error;
+ (BOOL) addClassMethod:(SEL)origSel error:(NSError**)error;

@end
