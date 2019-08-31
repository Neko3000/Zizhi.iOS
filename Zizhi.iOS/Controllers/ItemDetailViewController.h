//
//  ItemDetailViewController.h
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/30/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemDetailViewController : UIViewController{
    UISwipeGestureRecognizer* swipeGestureReconginzerUp;
    UISwipeGestureRecognizer* swipeGestureReconginzerRight;
    
    BOOL toFinalStatus;
}

@end

NS_ASSUME_NONNULL_END
