//
//  UIButton+ImageTitleCentering.m
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/28/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import "UIButton+ImageTitleCentering.h"

@implementation UIButton (ImageTitleCentering)

-(void) centerImageAndTitleWithSpacing:(CGFloat)spacing{
    self.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, spacing);
    self.titleEdgeInsets = UIEdgeInsetsMake(0, spacing, 0, 0);
}

@end
