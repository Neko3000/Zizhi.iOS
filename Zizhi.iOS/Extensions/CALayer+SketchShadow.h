//
//  CALayer+SketchShadow.h
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/29/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import <QuartzCore/QuartzCore.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface CALayer (SketchShadow)

- (void) applySketchShadow:(UIColor*)color alpha:(float)alpha x:(CGFloat)x y:(CGFloat)y blur:(CGFloat)blur spread:(CGFloat)spread;

@end

NS_ASSUME_NONNULL_END
