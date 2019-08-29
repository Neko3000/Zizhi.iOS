//
//  ImageGalleryView.h
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/29/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import "XibUIView.h"
#import "ReshapableImageView.h"

NS_ASSUME_NONNULL_BEGIN

@interface ImageGalleryView : XibUIView{
    NSMutableArray* imageViewList;
    
    int currentIndex;
    CGFloat centeredImageViewWidth;
    CGFloat centeredImageViewHeight;
    CGFloat horizontalSpacing;
    
    UIPanGestureRecognizer* panGestureReconginzer;
    CGFloat gestureStartOffsetX;
    
    BOOL isInitialized;
}

@end

NS_ASSUME_NONNULL_END
