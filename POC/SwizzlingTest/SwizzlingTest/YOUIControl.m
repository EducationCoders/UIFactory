//
//  YOUIControl.m
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import "YOUIControl.h"

@implementation UIControl(YO_ControlSwizzling)

+(void) initialize
{
    NSLog(@"%@ initialize", NSStringFromClass(self));
}

- (void)decorateView
{
    NSLog(@"%@ decorate", NSStringFromClass([self class]));
    
    self.layer.borderColor = [[UIColor greenColor] CGColor];
    self.layer.borderWidth = 1.0f;
}

- (void) undecorateView:(UIView *)parent
{
    [super undecorateView:parent];
    
    self.layer.borderColor = NULL;
    self.layer.borderWidth = 0.0f;
}
@end
