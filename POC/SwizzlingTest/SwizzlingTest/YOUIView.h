//
//  YOUIView.h
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIView(YO_ControlSwizzling)

@property (nonatomic, assign) BOOL disableYOSkinning;

-(void) decorateView;
-(void) undecorateView:(UIView*) parent;
-(void) undecorateSubviews;

@end
