//
//  YOUIView.h
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "SwizzlingEvents.h"

@interface UIView(YO_ControlSwizzling) <SwizzlingEventsInitialization, SwizzlingEventsDrawing>

@property (nonatomic, assign) BOOL disableYOSkinning;
@property (nonatomic, strong) CALayer *yoSkinningLayer;

-(void) decorateView;
-(void) undecorateView:(UIView*) parent;
-(void) undecorateSubviews;

@end
