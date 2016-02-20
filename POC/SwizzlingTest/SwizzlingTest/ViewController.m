//
//  ViewController.m
//  SwizzlingTest
//
//  Created by omkar on 20/02/16.
//  Copyright (c) 2016 YO Pvt Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIButton *button = [UIButton buttonWithType:(UIButtonTypeRoundedRect)];
    [button setFrame:CGRectMake(10, 10, 100, 100)];
    [button setTitle:@"Test Button" forState:(UIControlStateNormal)];
    
    
    button.layer.backgroundColor = [[UIColor yellowColor] CGColor];
    
    [self.view addSubview:button];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
