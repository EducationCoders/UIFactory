//
//  YOUILabel.m
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import "YOUILabel.h"

@implementation UILabel(YO_ControlSwizzling)

+(void) initialize
{
    NSLog(@"%@ initialize", NSStringFromClass(self));
}

- (void) decorateView
{
    NSLog(@"%@ decorate", NSStringFromClass([self class]));
    
    [super decorateView];
}


@end
