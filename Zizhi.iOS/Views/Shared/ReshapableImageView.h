//
//  ReshapableImage.h
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/29/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ReshapableImageView : UIView{
    UIImageView* mainImageView;
    bool isInitialized;
}

- (void) setImage:(UIImage*) image;
- (void) setCornerRadius:(CGFloat) cornerRadius;
- (void) setContentMode:(UIViewContentMode) contentMode;

@end

NS_ASSUME_NONNULL_END
