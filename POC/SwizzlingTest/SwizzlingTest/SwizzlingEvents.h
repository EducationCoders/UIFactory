//
//  SwizzlingEvents.h
//  SwizzlingTest
//
//  Created by omkar on 21/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

@protocol SwizzlingEventsInitialization <NSObject>

-(void) objectWillInitialize;
-(void) objectDidInitialize;

@end

@protocol SwizzlingEventsDrawing <NSObject>

-(void) drawRectWillExecuteWithRect:(CGRect) frame;
-(void) drawRectDidExecuteWithRect:(CGRect) frame;
-(void) drawLayerWillExecuteForLayer:(CALayer*) layer inContext:(CGContextRef) ctx;
-(void) drawLayerDidExecuteForLayer:(CALayer*) layer inContext:(CGContextRef) ctx;

@end
