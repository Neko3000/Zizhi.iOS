//
//  ItemDetailViewController.m
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/30/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import "ItemDetailViewController.h"
#import "ImageGalleryView.h"
#import "CALayer+SketchShadow.h"

@interface ItemDetailViewController ()

@property (weak, nonatomic) IBOutlet ImageGalleryView *imageGalleryView;

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemShortDescritptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIView *headerBlockShadowCaster;


@property (weak, nonatomic) IBOutlet UILabel *itemSellerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemTagLabel;
@property (weak, nonatomic) IBOutlet UITextView *itemDescriptionTextView;

@property (weak, nonatomic) IBOutlet UILabel *editorNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *editorAvatarImageView;
@property (weak, nonatomic) IBOutlet UIView *footerBlockShadowCaster;


@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;


@end

@implementation ItemDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    // mainScrollView
    
    // imageGalleryView
    
    // Header
    self.itemNameLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"黑檀玉兰发簪" attributes:@{NSKernAttributeName:@(3.6)}];
    self.itemShortDescritptionLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"黑檀配玉兰，便观她将这秀发盘。" attributes:@{NSKernAttributeName:@(2.1)}];
    self.itemPriceLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"￥168.80" attributes:@{NSKernAttributeName:@(3)}];
    [self.shareBtn.layer applySketchShadow:[UIColor colorNamed:@"Shadow-LightBlue"] alpha:1.0 x:0 y:10 blur:12.0 spread:0];
    self.headerBlockShadowCaster.layer.cornerRadius = 6.0;
    [self.headerBlockShadowCaster.layer applySketchShadow:[UIColor colorNamed:@"Shadow-LightBlue"] alpha:1.0 x:0 y:-12 blur:16.0 spread:0];
    self.itemPriceLabel.layer.anchorPoint = CGPointMake(0.5, 0);
    
    // Body
    self.itemDescriptionTextView.text = self.itemDescriptionTextView.text;
    [self.itemDescriptionTextView setSelectable:NO];
    
    // Footer
    self.editorAvatarImageView.layer.cornerRadius = 20.0;
    self.editorAvatarImageView.layer.masksToBounds = YES;
    self.editorNameLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"- 晚风了" attributes:@{NSKernAttributeName:@(1.8)}];
    self.footerBlockShadowCaster.layer.cornerRadius = 6.0;
    [self.footerBlockShadowCaster.layer applySketchShadow:[UIColor colorNamed:@"Shadow-LightBlue"] alpha:1.0 x:0 y:12.0 blur:16.0 spread:0];
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
