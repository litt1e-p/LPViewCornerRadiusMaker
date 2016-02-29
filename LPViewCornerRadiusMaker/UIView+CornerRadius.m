//
//  UIView+CornerRadius.m
//  LPViewCornerRadiusMaker
//
//  Created by litt1e-p on 16/2/24.
//  Copyright © 2016年 litt1e-p. All rights reserved.
//

#import "UIView+CornerRadius.h"

#define kLPCornerDefaultRadius 3.f

@implementation UIView (CornerRadius)

- (void)makeCornerRadius
{
    [self createCornerRadiusWithRadius:kLPCornerDefaultRadius rectCorner:UIRectCornerAllCorners];
}

- (void)makeCornerRadiusWithRadius:(CGFloat)radius rectCorner:(UIRectCorner)rectCorner
{
    [self createCornerRadiusWithRadius:radius rectCorner:rectCorner];
}

- (void)createCornerRadiusWithRadius:(CGFloat)radius rectCorner:(UIRectCorner)rectCorner
{
    if ([self isKindOfClass:[UIImageView class]]) {
        UIImageView *selfIv = (UIImageView *)self;
        if (selfIv.image) {
            selfIv.image = [selfIv.image imageCornerWithRadius:radius size:selfIv.bounds.size rectCorner:rectCorner];
        }
    } else {
        UIBezierPath *maskPath  = [UIBezierPath bezierPathWithRoundedRect:self.bounds
                                                        byRoundingCorners:rectCorner
                                                              cornerRadii:CGSizeMake(radius, radius)];
        CAShapeLayer *maskLayer = [[CAShapeLayer alloc] init];
        maskLayer.frame         = self.bounds;
        maskLayer.path          = maskPath.CGPath;
        self.layer.mask         = maskLayer;
    }
}

@end

@implementation UIImage (CornerRadius)

- (UIImage *)imageCornerWithRadius:(CGFloat)radius size:(CGSize)size rectCorner:(UIRectCorner)rectCorner
{
    CGRect rect = (CGRect){{0, 0}, size};
    UIGraphicsBeginImageContextWithOptions(rect.size, false, [UIScreen mainScreen].scale);
    UIBezierPath *path = [UIBezierPath bezierPathWithRoundedRect:rect byRoundingCorners:rectCorner cornerRadii:CGSizeMake(radius, radius)];
    
    CGContextAddPath(UIGraphicsGetCurrentContext(), path.CGPath);
    CGContextClip(UIGraphicsGetCurrentContext());
    [self drawInRect:rect];
    CGContextDrawPath(UIGraphicsGetCurrentContext(), kCGPathFillStroke);
    UIImage *output = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return output;
}

@end
