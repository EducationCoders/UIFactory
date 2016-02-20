//
//  YOCommonSwizzling.m
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import "YOCommonSwizzling.h"

@implementation NSObject(YO_ControlSwizzling)

+(void) commonSwizzlingTask
{
}

+(BOOL) swizzleMethod:(SEL) originalMethod withNewMethod:(SEL) newMethod error:(NSError**) errorOut;
{
    NSError *error = nil;
    BOOL bSuccess = NO;
    @try
    {
        bSuccess = [self jr_swizzleMethod:originalMethod withMethod:newMethod error:&error];
        if (!bSuccess)
        {
            @throw [NSException exceptionWithName:YO_SwizzlingDomain reason:error.description userInfo:error.userInfo];
        }
    }
    @catch (NSException *exception)
    {
        NSLog(@"Exception caught - %@", exception);
        error = [NSError errorWithDomain:YO_SwizzlingDomain code:-1001 userInfo:exception.userInfo];
    }
    
    if (errorOut)
    {
        *errorOut = error;
    }
    
    return bSuccess;
}

@end
