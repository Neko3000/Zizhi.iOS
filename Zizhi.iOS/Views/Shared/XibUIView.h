//
//  XibUIView.h
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/29/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface XibUIView : UIView{
@private
    UIView* contentView;
}

- (void) xibSetup;
- (UIView*) loadViewFromNib;

@end

NS_ASSUME_NONNULL_END
