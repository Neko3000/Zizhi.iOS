//
//  ItemListItemTableViewCell.h
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/29/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ItemListItemTableViewCell : UITableViewCell{
    @private
    BOOL isInitialized;
}

- (void) setCoverImage:(UIImage*) image;
- (void) setName:(NSString*) name;
- (void) setSellerName:(NSString*) seller;
- (void) setTag:(NSString*) tag;
- (void) setPrice:(NSString*) price;
- (void) setNumber:(NSString*) number;

@end

NS_ASSUME_NONNULL_END
