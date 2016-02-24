//
//  UIView+CornerRadius.m
//  LPViewCornerRadiusMaker
//
//  Created by litt1e-p on 16/2/24.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "UIView+CornerRadius.h"

#define kPositionAll @[@(LPCornerRadiusPositionTopLeft), @(LPCornerRadiusPositionTopRight), @(LPCornerRadiusPositionBottomLeft), @(LPCornerRadiusPositionBottomRight)]

#define kLPCornerDefaultRadius 3.f

@implementation UIView (CornerRadius)

- (void)makeCornerRadius
{
    [self createCornerRadiusWithRadius:kLPCornerDefaultRadius positions:[kPositionAll copy]];
}

- (void)makeCornerRadiusWithRadius:(CGFloat)radius position:(LPCornerRadiusPosition)position
{
    NSArray *positions = [NSArray array];
    if (position == LPCornerRadiusPositionAll) {
        positions = [kPositionAll copy];
    } else {
        positions = @[@(position)];
    }
    [self createCornerRadiusWithRadius:radius positions:positions];
}

- (void)makeCornerRadiusWithRadius:(CGFloat)radius positions:(NSArray *)positions
{
    NSMutableDictionary *directionDict = [[NSMutableDictionary alloc] init];
    for (NSNumber *pos in positions) {
        if ([kPositionAll containsObject:pos]) {
            [directionDict setObject:@1 forKey:pos];
        }
    }
    if ([directionDict allKeys].count > 0) {
        [self createCornerRadiusWithRadius:radius positions:[directionDict allKeys]];
    }
}

- (UIView *)createCornerRadiusWithRadius:(CGFloat)radius positions:(NSArray *)positions
{
    __block UIRectCorner corner = 0;
    if (positions.count > 0) {
        [positions enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            LPCornerRadiusPosition pos = [obj integerValue];
            UIRectCorner cor           = (UIRectCorner)pos;
            corner                     = corner | cor;
        }];
    }
    UIBezierPath *maskPath  = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                     byRoundingCorners:corner
                                           cornerRadii:CGSizeMake(radius, radius)];
    CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
    maskLayer.frame         = self.bounds;
    maskLayer.path          = maskPath.CGPath;
    self.layer.mask         = maskLayer;
    return self;
}

@end
