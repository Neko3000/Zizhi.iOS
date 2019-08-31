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

@interface ItemDetailViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet ImageGalleryView *imageGalleryView;

@property (weak, nonatomic) IBOutlet UILabel *itemNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemShortDescritptionLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemPriceLabel;
@property (weak, nonatomic) IBOutlet UIButton *shareBtn;
@property (weak, nonatomic) IBOutlet UIImageView *splitterImageView;
@property (weak, nonatomic) IBOutlet UIView *headerBlockShadowCaster;
@property (weak, nonatomic) IBOutlet UIView *headerBlock;

@property (weak, nonatomic) IBOutlet UILabel *itemSellerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *itemTagLabel;
@property (weak, nonatomic) IBOutlet UITextView *itemDescriptionTextView;

@property (weak, nonatomic) IBOutlet UILabel *editorNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *editorAvatarImageView;
@property (weak, nonatomic) IBOutlet UIView *footerBlockShadowCaster;

@property (weak, nonatomic) IBOutlet UIScrollView *mainScrollView;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *imageGalleryViewConstraintTop;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headerConstraintTopSpacingToImageGalleryView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bodyConstraintTopSpacingToHeader;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *footerConstraintTopSpcaingToBody;

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
    
    // ScrollView
    [self.mainScrollView setScrollEnabled:NO];
    self.mainScrollView.delegate = self;
    
    // GesutreReconginzer
    swipeGestureReconginzerUp = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureReconginzerHandler:)];
    swipeGestureReconginzerUp.direction = UISwipeGestureRecognizerDirectionUp;
    [self.view addGestureRecognizer:swipeGestureReconginzerUp];
    
    swipeGestureReconginzerRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeGestureReconginzerHandler:)];
    swipeGestureReconginzerRight.direction = UISwipeGestureRecognizerDirectionRight;
    [self.view addGestureRecognizer:swipeGestureReconginzerRight];
    
    [self.view setUserInteractionEnabled:YES];
}

- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    self.headerConstraintTopSpacingToImageGalleryView.constant = self.view.safeAreaLayoutGuide.layoutFrame.size.height - self.imageGalleryView.frame.origin.y - self.imageGalleryView.frame.size.height - self.headerBlock.frame.size.height;
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void) playHeaderAnimation:(BOOL)toFinalStatus duration:(float)duration{
    
    CGFloat priceLabelScaleRatio = 0.674;
    
    if(toFinalStatus){
        
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            self.itemPriceLabel.transform = CGAffineTransformMakeScale(priceLabelScaleRatio, priceLabelScaleRatio);
            self.splitterImageView.alpha = 0;
        } completion:^(BOOL finished){
            
        }];
    }
    else{
        [UIView animateWithDuration:duration delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^(){
            self.itemPriceLabel.transform = CGAffineTransformMakeScale(1.0, 1.0);
            self.splitterImageView.alpha = 1.0;
        } completion:^(BOOL finished){
            
        }];
        
    }
    
}

- (void) transition:(BOOL)toFinalStatus{
    if(toFinalStatus){
        self.imageGalleryViewConstraintTop.constant = -265 -20;
        self.bodyConstraintTopSpacingToHeader.constant = -59;
        self.footerConstraintTopSpcaingToBody.constant = 13;
        
        [self playHeaderAnimation:YES duration:0.7];
        
        [UIView animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished){
            
            [self.mainScrollView setScrollEnabled:YES];
            [self->swipeGestureReconginzerUp setEnabled:NO];
        }];
    }
    else{
        self.imageGalleryViewConstraintTop.constant = 13;
        self.bodyConstraintTopSpacingToHeader.constant = -59 + 100;
        self.footerConstraintTopSpcaingToBody.constant = 13 + 100;
        
        [self playHeaderAnimation:NO duration:0.7];
        
        [UIView  animateWithDuration:0.7 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
            
            [self.view layoutIfNeeded];
        } completion:^(BOOL finished){
            
            [self.mainScrollView setScrollEnabled:NO];
            [self->swipeGestureReconginzerUp setEnabled:YES];
        }];
    }
}

- (void) swipeGestureReconginzerHandler:(UISwipeGestureRecognizer*)swipeGestureReconginzer{
    if(swipeGestureReconginzer.direction == UISwipeGestureRecognizerDirectionUp){
        [self transition:YES];
    }
    else if(swipeGestureReconginzer.direction == UISwipeGestureRecognizerDirectionRight){
        [self.navigationController popViewControllerAnimated:YES];
    }
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if(scrollView.contentOffset.y <= -20){
        [self transition:NO];
    }
}

@end
