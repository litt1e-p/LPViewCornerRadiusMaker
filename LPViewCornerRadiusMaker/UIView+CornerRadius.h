//
//  UIView+CornerRadius.h
//  LPViewCornerRadiusMaker
//
//  Created by litt1e-p on 16/2/24.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CornerRadius)

- (void)makeCornerRadius;
- (void)makeCornerRadiusWithRadius:(CGFloat)radius rectCorner:(UIRectCorner)rectCorner;

@end

@interface UIImage (CornerRadius)

- (UIImage *)imageCornerWithRadius:(CGFloat)radius size:(CGSize)size rectCorner:(UIRectCorner)rectCorner;

@end
