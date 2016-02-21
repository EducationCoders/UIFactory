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

@dynamic disableYOSkinning;

#pragma - mark
#pragma - mark ------- Runtime Properties -----

NSString const *keyDisableYOSkinning = @"yo.runtime.property.disableYOSkinning";

- (void) setDisableYOSkinning:(BOOL)disableYOSkinning
{
    objc_setAssociatedObject(self, &keyDisableYOSkinning, @(disableYOSkinning), OBJC_ASSOCIATION_ASSIGN);
    
    if (self.disableYOSkinning)
    {
        [self undecorateViewBase:nil];
    }
    else
    {
        [self decorateViewBase];
    }
}

- (BOOL) disableYOSkinning
{
    return [objc_getAssociatedObject(self, &keyDisableYOSkinning) boolValue];
}


NSString const *keyYoSkinningLayer = @"yo.runtime.property.yoSkinningLayer";

- (void) setYoSkinningLayer:(CALayer *)yoSkinningLayer
{
    objc_setAssociatedObject(self, &keyYoSkinningLayer, yoSkinningLayer, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (CALayer *) yoSkinningLayer
{
    return objc_getAssociatedObject(self, &keyYoSkinningLayer);
}

#pragma - mark
#pragma - mark ------- Swizzling -----

+(void) initialize
{
    NSLog(@"%@ initialize", NSStringFromClass(self));
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleMethod:@selector(initWithCoder:) withNewMethod:@selector(initWithCoder_swizzled:) error:nil];
        [self swizzleMethod:@selector(initWithFrame:) withNewMethod:@selector(initWithFrame_swizzled:) error:nil];
        [self swizzleMethod:@selector(drawRect:) withNewMethod:@selector(drawRect_swizzled:) error:nil];
        [self swizzleMethod:@selector(drawLayer:inContext:) withNewMethod:@selector(drawLayer_swizzled:inContext:) error:nil];
        [self swizzleMethod:@selector(setBounds:) withNewMethod:@selector(setBounds_swizzled:) error:nil];
        [self swizzleMethod:@selector(setFrame:) withNewMethod:@selector(setFrame_swizzled:) error:nil];
    });
}

+(BOOL) checkIfObject:(Class) object overridesSelector:(SEL)selector {
    
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
    [self objectWillInitialize];
    
    id result = [self initWithCoder_swizzled:aDecoder]; //Equivalent to [super initWithCoder:]
    
    [self objectDidInitialize];
    
    [self decorateViewBase];
    
    return result;
}

-(id) initWithFrame_swizzled:(CGRect)frame
{
    [self objectWillInitialize];
    
    id result = [self initWithFrame_swizzled:frame]; //Equivalent to [super initWithFrame:]
    
    [self objectDidInitialize];
    
    [self decorateViewBase];
    
    return result;
}

- (void) drawRect_swizzled:(CGRect)rect
{
    [self drawRectWillExecuteWithRectBase:rect];
    
    [self drawRect_swizzled:rect];
    
    [self drawRectDidExecuteWithRectBase:rect];
}

- (void) drawLayer_swizzled:(CALayer *)layer inContext:(CGContextRef)ctx
{
    [self drawLayerWillExecuteForLayerBase:layer inContext:ctx];
    
    [self drawLayer_swizzled:layer inContext:ctx];
    
    [self drawLayerDidExecuteForLayerBase:layer inContext:ctx];
}

- (void) setFrame_swizzled:(CGRect)bounds
{
    [self setFrame_swizzled:bounds];
    
    [self updateYOLayerFrame:self.bounds];
}

- (void) setBounds_swizzled:(CGRect)bounds
{
    [self setBounds_swizzled:bounds];
    
    [self updateYOLayerFrame:self.bounds];
}

#pragma - mark
#pragma - mark ------- Decoration -----

-(void) decorateView
{
    [self checkAndInitializeYOSkinningLayer];
}

-(void) undecorateView:(UIView*) parent
{
    [self.yoSkinningLayer removeFromSuperlayer];
}

-(void) undecorateSubviews
{
    for (UIView* subview in self.subviews)
    {
        [subview undecorateView:self];
    }
}


#pragma - mark
#pragma - mark ------- Swizzling Events -----

//Subclass can override below methods for custom handling
- (void) objectWillInitialize
{
}

- (void) objectDidInitialize
{
}

-(void) drawRectWillExecuteWithRect:(CGRect) frame
{
}

-(void) drawRectDidExecuteWithRect:(CGRect) frame
{
}

-(void) drawLayerWillExecuteForLayer:(CALayer*) layer inContext:(CGContextRef) ctx
{
}

-(void) drawLayerDidExecuteForLayer:(CALayer*) layer inContext:(CGContextRef) ctx
{
}

#pragma - mark
#pragma - mark ------- Private -----

-(void) checkAndInitializeYOSkinningLayer
{
    if (!self.yoSkinningLayer)
    {
        self.yoSkinningLayer = [CALayer layer];
    }
    
    if(![self.yoSkinningLayer superlayer])
    {
        [self updateYOLayerFrame:self.bounds];
        
        [self.layer insertSublayer:self.yoSkinningLayer atIndex:0];
    }
}

-(void) updateYOLayerFrame:(CGRect) newFrame
{
    self.yoSkinningLayer.frame = newFrame;
}

-(void) decorateViewBase
{
    NSLog(@"%@ decorate", NSStringFromClass([self class]));
    
    [self checkAndInitializeYOSkinningLayer];
    
    [self decorateView];
}

-(void) undecorateViewBase:(UIView *)parent
{
    [self undecorateView:parent];
}

-(void) objectWillInitializeBase
{
    [self objectWillInitialize];
}

-(void) objectDidInitializeBase
{
    [self objectDidInitialize];
}

-(void) drawRectWillExecuteWithRectBase:(CGRect) frame
{
    [self drawRectWillExecuteWithRect:frame];
}

-(void) drawRectDidExecuteWithRectBase:(CGRect) frame
{
    [self drawRectDidExecuteWithRect:frame];
}

-(void) drawLayerWillExecuteForLayerBase:(CALayer*) layer inContext:(CGContextRef) ctx
{
    [self drawLayerWillExecuteForLayer:layer inContext:ctx];
}

-(void) drawLayerDidExecuteForLayerBase:(CALayer*) layer inContext:(CGContextRef) ctx
{
    [self drawLayerDidExecuteForLayer:layer inContext:ctx];
}


@end
