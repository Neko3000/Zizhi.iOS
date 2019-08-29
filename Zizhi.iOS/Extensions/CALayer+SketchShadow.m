//
//  CALayer+SketchShadow.m
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/29/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import "CALayer+SketchShadow.h"

@implementation CALayer (SketchShadow)

- (void)applySketchShadow:(UIColor *)color alpha:(float)alpha x:(CGFloat)x y:(CGFloat)y blur:(CGFloat)blur spread:(CGFloat)spread{
    self.shadowColor = color.CGColor;
    self.shadowOpacity = alpha;
    self.shadowOffset = CGSizeMake(x, y);
    self.shadowRadius = blur / 2.0;
    
    if(spread == 0){
        self.shadowPath = nil;
    }
    else{
        CGFloat dx = - spread;
        CGRect rect = CGRectInset(self.bounds, dx, dx);
        self.shadowPath = [UIBezierPath bezierPathWithRect:rect].CGPath;
    }
}

@end
