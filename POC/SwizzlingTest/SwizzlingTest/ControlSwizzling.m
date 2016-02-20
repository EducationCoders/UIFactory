//
//  ControlSwizzling.m
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//


#import "ControlSwizzling.h"
#import "JRSwizzle.h"


@implementation UIView(ControlSwizzling)

+ (void)initialize
{
    NSLog(@"%@ %s called", NSStringFromClass(self), __FUNCTION__);
}

-(void) decorateControl
{
}

@end


@implementation UIButton(ControlSwizzling)

+ (void)initialize
{
    NSLog(@"%@ %s called", NSStringFromClass(self), __FUNCTION__);
}

@end

@implementation UILabel(ControlSwizzling)

+ (void) initialize
{
    NSLog(@"%@ %s called", NSStringFromClass(self), __FUNCTION__);
    
    NSError *error = nil;
    BOOL bSuccess = [self jr_swizzleMethod:@selector(initWithCoder:) withMethod:@selector(initWithCoder_swizzled:) error:&error];
    
    bSuccess = [self jr_swizzleMethod:@selector(initWithFrame:) withMethod:@selector(initWithFrame_swizzled:) error:&error];
    
    if (!bSuccess)
    {
        NSLog(@"Error %s - %@", __FUNCTION__, error);
    }
}

- (id) initWithFrame_swizzled:(CGRect)frame
{
    id result = [self initWithFrame:frame];
    
    [self decorateControl];
    
    return result;
}


- (id) initWithCoder_swizzled:(NSCoder *)aDecoder
{
    id result = [self initWithCoder_swizzled:aDecoder];
    
    [self decorateControl];
    
    return result;
}

-(void) decorateControl
{
    self.backgroundColor = [UIColor greenColor];
}

@end

