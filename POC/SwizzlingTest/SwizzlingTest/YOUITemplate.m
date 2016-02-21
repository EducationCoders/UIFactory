//
//  YOUITemplate.m
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import "YOCommonSwizzling.h"
#import "YOUITemplate.h"


@implementation UITemplate(YO_ControlSwizzling)

//@dynamic disableYOSkinning; Add runtime properties

#pragma - mark
#pragma - mark ------- Runtime Properties -----


#pragma - mark
#pragma - mark ------- Swizzling -----

+(void) load
{
}

+(void) initialize
{
    NSLog(@"%@ initialize", NSStringFromClass(self));
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
    });
}


#pragma - mark
#pragma - mark ------- Decoration -----

-(void) decorateView
{
    NSLog(@"%@ decorate", NSStringFromClass([self class]));
    
    //Decoration control
}

-(void) undecorateView:(UIView*) parent
{
    [super undecorateView:parent];
    
    //Undecoration control
}

#pragma - mark
#pragma - mark ------- Private -----

@end
