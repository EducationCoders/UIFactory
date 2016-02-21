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
    
    self.layer.borderColor = [[UIColor blueColor] CGColor];
    self.layer.borderWidth = 1.0f;
    self.layer.backgroundColor = [[[UIColor purpleColor] colorWithAlphaComponent:0.7] CGColor];
}


- (void) undecorateView:(UIView *)parent
{
    [super undecorateView:parent];
    
    [self.titleLabel undecorateView:self];
    self.layer.borderColor = NULL;
    self.layer.borderWidth = 0.0f;
    self.layer.backgroundColor = NULL;
}


@end
