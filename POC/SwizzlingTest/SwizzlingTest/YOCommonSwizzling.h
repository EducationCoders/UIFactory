//
//  YOCommonSwizzling.h
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "JRSwizzle.h"

#define YO_SwizzlingDomain  @"YO_SwizzlingDomain"

@interface NSObject(YO_ControlSwizzling)

+(void) commonSwizzlingTask;
+(BOOL) swizzleMethod:(SEL) originalMethod withNewMethod:(SEL) newMethod error:(NSError**) errorOut;

@end
