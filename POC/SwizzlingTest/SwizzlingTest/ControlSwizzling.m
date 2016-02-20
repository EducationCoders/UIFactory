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
    NSError *error = nil;
    BOOL bSuccess = [self jr_swizzleMethod:@selector(drawRect:) withMethod:@selector(drawRect_swizzled:) error:&error];
}

- (void)drawRect_swizzled:(CGRect)rect
{
    
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
    
    NSLog(@"SEL before - %p %p", @selector(initWithFrame:), @selector(initWithFrame_swizzled:));
    NSLog(@"IMP before - %p %p", [self methodForSelector:@selector(initWithFrame:)], [self methodForSelector:@selector(initWithFrame_swizzled:)]);
    
    bSuccess = [self jr_swizzleMethod:@selector(initWithFrame:) withMethod:@selector(initWithFrame_swizzled:) error:&error];

    NSLog(@"SEL after - %p %p", @selector(initWithFrame:), @selector(initWithFrame_swizzled:));
    NSLog(@"IMP after - %p %p", [self methodForSelector:@selector(initWithFrame:)], [self methodForSelector:@selector(initWithFrame_swizzled:)]);
    
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

