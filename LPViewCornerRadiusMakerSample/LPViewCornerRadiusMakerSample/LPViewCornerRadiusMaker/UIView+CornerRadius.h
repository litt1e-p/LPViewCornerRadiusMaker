//
//  UIView+CornerRadius.h
//  LPViewCornerRadiusMaker
//
//  Created by litt1e-p on 16/2/24.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSUInteger, LPCornerRadiusPosition)
{
    LPCornerRadiusPositionTopLeft     = 1 << 0,
    LPCornerRadiusPositionTopRight    = 1 << 1,
    LPCornerRadiusPositionBottomLeft  = 1 << 2,
    LPCornerRadiusPositionBottomRight = 1 << 3,
    LPCornerRadiusPositionAll  = ~0UL
};

@interface UIView (CornerRadius)

- (void)makeCornerRadius;
- (void)makeCornerRadiusWithRadius:(CGFloat)radius position:(LPCornerRadiusPosition)position;
- (void)makeCornerRadiusWithRadius:(CGFloat)radius positions:(NSArray *)positions;

@end
