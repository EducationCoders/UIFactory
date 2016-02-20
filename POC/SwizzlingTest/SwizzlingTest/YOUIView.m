//
//  YOUIView.m
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import "YOUIView.h"
#import "YOCommonSwizzling.h"

@implementation UIView(YO_ControlSwizzling)

+(void) initialize
{
    NSLog(@"%@ initialize", NSStringFromClass(self));
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(initWithCoder:) withNewMethod:@selector(initWithCoder_swizzled:) error:nil];
        [self swizzleMethod:@selector(initWithFrame:) withNewMethod:@selector(initWithFrame_swizzled:) error:nil];
    });
}

+(BOOL)checkIfObject:(Class) object overridesSelector:(SEL)selector {
    
    Class objSuperClass = [object superclass];
    BOOL isMethodOverridden = [NSStringFromClass(object) isEqualToString:@"UIView"];
    
    while (objSuperClass != Nil && ![NSStringFromClass(objSuperClass) isEqualToString:@"UIResponder"]) {
        
        IMP imp1 = [object instanceMethodForSelector: selector];
        IMP superImp = [objSuperClass instanceMethodForSelector: selector];
        
        isMethodOverridden =  imp1!=superImp;
        
        
        if (isMethodOverridden) {
            break;
        }
        
        objSuperClass = [objSuperClass superclass];
    }
    
    return isMethodOverridden;
}

-(id) initWithCoder_swizzled:(NSCoder *)aDecoder
{
    id result = [self initWithCoder_swizzled:aDecoder]; //Equivalent to [super initWithCoder:]
    [self decorateView];
    return result;
}

-(id) initWithFrame_swizzled:(CGRect)frame
{
    id result = [self initWithFrame_swizzled:frame]; //Equivalent to [super initWithFrame:]
    [self decorateView];
    return result;
}

-(void) decorateView
{
    NSLog(@"%@ decorate", NSStringFromClass([self class]));
    
    self.layer.borderColor = [[UIColor redColor] CGColor];
    self.layer.borderWidth = 2.0f;
}

-(void) undecorateView:(UIView*) parent
{
    self.layer.borderColor = NULL;
    self.layer.borderWidth = 0.0f;
}

-(void) undecorateSubviews
{
    for (UIView* subview in self.subviews)
    {
        [subview undecorateView:self];
    }
}

@end
