//
//  ReshapableImage.m
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/29/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import "ReshapableImageView.h"

@interface ReshapableImageView()

@end

@implementation ReshapableImageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)init
{
    self = [super init];
    if (self) {
        mainImageView = [[UIImageView alloc] init];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        mainImageView = [[UIImageView alloc] init];
    }
    return self;
}

- (void)awakeFromNib{
    [super awakeFromNib];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    [self setup];
}

- (void)setup{
    if(!isInitialized){
        mainImageView.frame = self.bounds;
        
        mainImageView.layer.masksToBounds = YES;
        
        [self addSubview:mainImageView];
        
        isInitialized = YES;
    }
}

- (void)setImage:(UIImage*)image{
    mainImageView.image = image;
}
- (void)setCornerRadius:(CGFloat)cornerRadius{
    mainImageView.layer.cornerRadius = cornerRadius;
    self.layer.cornerRadius = cornerRadius;
}

- (void)setContentMode:(UIViewContentMode)contentMode{
    mainImageView.contentMode = contentMode;
}

@end
