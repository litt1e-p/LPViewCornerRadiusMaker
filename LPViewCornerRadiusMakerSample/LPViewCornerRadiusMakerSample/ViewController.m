//
//  ViewController.m
//  LPViewCornerRadiusMakerSample
//
//  Created by litt1e-p on 16/2/24.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "ViewController.h"
#import "UIView+CornerRadius.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIView *v1 = [[UIView alloc] initWithFrame:CGRectMake(150, 50, 100, 100)];
    v1.backgroundColor = [UIColor blackColor];
    [v1 makeCornerRadius];
    [self.view addSubview:v1];
    
    UIView *v2 = [[UIView alloc] initWithFrame:CGRectMake(150, 180, 100, 100)];
    v2.backgroundColor = [UIColor brownColor];
    [v2 makeCornerRadiusWithRadius:5.f position:LPCornerRadiusPositionTopLeft];
    [self.view addSubview:v2];
    
    UIView *v3 = [[UIView alloc] initWithFrame:CGRectMake(150, 300, 100, 170)];
    v3.backgroundColor = [UIColor purpleColor];
    [v3 makeCornerRadiusWithRadius:8.f positions:@[@(LPCornerRadiusPositionBottomLeft), @(LPCornerRadiusPositionTopLeft)]];
    [self.view addSubview:v3];
}

@end
