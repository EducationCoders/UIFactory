//
//  YOUIButton.m
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import "YOUIButton.h"

@implementation UIButton(YO_ControlSwizzling)

+(void) initialize
{
    NSLog(@"%@ initialize", NSStringFromClass(self));
}

- (void) decorateView
{
    NSLog(@"%@ decorate", NSStringFromClass([self class]));
    
    [self.titleLabel undecorateView:self];
    
    self.yoSkinningLayer.backgroundColor = [[UIColor blueColor] CGColor];
    self.yoSkinningLayer.cornerRadius = 2.f;
}


- (void) undecorateView:(UIView *)parent
{
    [super undecorateView:parent];
}


@end
