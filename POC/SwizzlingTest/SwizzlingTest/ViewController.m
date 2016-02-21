//
//  ViewController.m
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import "ViewController.h"
#import "YOUIButton.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    //Test Disabling decoration for this button
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    [button setFrame:CGRectMake(50, 10, 200, 50)];
    [button setTitle:@"Button added at runtime" forState:(UIControlStateNormal)];
    
    button.disableYOSkinning = YES;
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        button.disableYOSkinning =  NO;
    });
    
//    [[[button.layer sublayers] objectAtIndex:0] setBackgroundColor:[[UIColor greenColor] CGColor]];
    
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
