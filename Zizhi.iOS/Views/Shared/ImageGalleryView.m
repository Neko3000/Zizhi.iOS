//
//  ImageGalleryView.m
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/29/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import "ImageGalleryView.h"
#import "CALayer+SketchShadow.h"

@interface ImageGalleryView()

@property (weak, nonatomic) IBOutlet UIView *mainContainer;

@end

@implementation ImageGalleryView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)awakeFromNib{
    [super awakeFromNib];
    
    [self setup];
}

- (void)setup{
    if(!isInitialized){
        imageViewList = [[NSMutableArray alloc] init];
        
        ReshapableImageView* reshapableImageView1 = [[ReshapableImageView alloc] init];
        [reshapableImageView1 setImage:[UIImage imageNamed:@"example-pic-2"]];
        [reshapableImageView1 setContentMode:UIViewContentModeScaleToFill];
        [imageViewList addObject:reshapableImageView1];
        
        ReshapableImageView* reshapableImageView2 = [[ReshapableImageView alloc] init];
        [reshapableImageView1 setImage:[UIImage imageNamed:@"example-pic-3"]];
        [reshapableImageView2 setContentMode:UIViewContentModeScaleToFill];
        [imageViewList addObject:reshapableImageView2];
        
        centeredImageViewWidth = 303;
        centeredImageViewHeight = 342;
        
        horizontalSpacing = 18;
        
        panGestureReconginzer = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panGestureHandler:)];
        
        
        isInitialized = YES;
    }
}

- (void) panGestureHandler:(UIPanGestureRecognizer*) panGestureReconginzer{
    
    switch (panGestureReconginzer.state) {
        case UIGestureRecognizerStateBegan:{
            gestureStartOffsetX = [panGestureReconginzer locationInView:self].x - self.mainContainer.frame.origin.x;
            break;
        }
            
        case UIGestureRecognizerStateChanged:{
            self.mainContainer.frame = CGRectMake([panGestureReconginzer locationInView:self].x - gestureStartOffsetX, self.mainContainer.frame.origin.y, self.mainContainer.frame.size.width, self.mainContainer.frame.size.height);
            break;
        }
        
        case UIGestureRecognizerStateEnded:{
            CGFloat virtualIndex = ((self.frame.size.width - centeredImageViewWidth)/2.0 - self.mainContainer.frame.origin.x)/(centeredImageViewWidth + horizontalSpacing);
            CGFloat ratio = fmodf(virtualIndex, 1.0);
            
            int supposedIndex = ratio > 0.50 ? (int)(ceil(virtualIndex)):(int)(floor(virtualIndex));
            supposedIndex = supposedIndex < 0 ? 0:supposedIndex;
            supposedIndex = supposedIndex > imageViewList.count - 1 ? (int)(imageViewList.count - 1) : supposedIndex;
            
            CGFloat supposedPositionX = (self.mainContainer.frame.size.width - centeredImageViewWidth)/2.0 - (CGFloat)(supposedIndex * (centeredImageViewWidth + horizontalSpacing));
            [UIView animateWithDuration:0.4 delay:0 options:UIViewAnimationOptionCurveEaseOut animations:^{
                self.mainContainer.frame = CGRectMake(supposedPositionX, self.mainContainer.frame.origin.y, self.mainContainer.frame.size.width, self.mainContainer.frame.size.height);
                
                if(supposedIndex != self->currentIndex){
                    ((UIImageView*)self->imageViewList[self->currentIndex]).alpha = 0.3;
                    ((UIImageView*)self->imageViewList[supposedIndex]).alpha = 1.0;
                    
                }
            } completion:^(BOOL finished){
                
                self->currentIndex = supposedIndex;
            }];
            break;
        }
        default:
            break;
    }
}

- (void) addImage:(UIImage*) image{
    ReshapableImageView* reshapableImageView = [[ReshapableImageView alloc]init];
    [reshapableImageView setImage:image];
    [reshapableImageView setContentMode:UIViewContentModeScaleToFill];
    
    [imageViewList addObject:reshapableImageView];
}

- (void) setCornerRadiusForImageView:(CGFloat)radius{
    for(UIImageView* imageView in imageViewList){
        imageView.layer.cornerRadius = radius;
    }
}

- (void) setShadowForImageView{
    for(UIImageView* imageView in imageViewList){
        [imageView.layer applySketchShadow:[UIColor colorNamed:@"Shadow-Light-Blue"] alpha:1.0 x:0 y:16.0 blur:18.0 spread:0];
    }
}

- (void) setIndex:(int)index{
    currentIndex = index;
}

- (void) adjustLayout{
    CGFloat xPositionOfMainContainer = (self.frame.size.width - centeredImageViewWidth)/2.0 - (CGFloat)currentIndex * (centeredImageViewWidth + horizontalSpacing);
    CGFloat yPositionOfMainContainer = (self.frame.size.height - centeredImageViewHeight)/2.0;
    
    CGFloat widthOfMainContainer = centeredImageViewWidth * (CGFloat)(imageViewList.count) + horizontalSpacing * (CGFloat)(imageViewList.count - 1);
    CGFloat heightOfMainContainer = centeredImageViewHeight;
    
    self.mainContainer.frame = CGRectMake(xPositionOfMainContainer, yPositionOfMainContainer, widthOfMainContainer, heightOfMainContainer);
    
    for(int i = 0;i < imageViewList.count;i ++){
        UIImageView* currentImageView = imageViewList[i];
        currentImageView.alpha = i == currentIndex ? 1.0:0.3;
    }
}

- (void) initializeLayout{
    CGFloat xPositionOfMainContainer = (self.frame.size.width - centeredImageViewWidth)/2.0 - (CGFloat)currentIndex * (centeredImageViewWidth + horizontalSpacing);
    CGFloat yPositionOfMainContainer = (self.frame.size.height - centeredImageViewHeight)/2.0;
    
    CGFloat widthOfMainContainer = centeredImageViewWidth * (CGFloat)(imageViewList.count) + horizontalSpacing * (CGFloat)(imageViewList.count - 1);
    CGFloat heightOfMainContainer = centeredImageViewHeight;
    
    self.mainContainer.frame = CGRectMake(xPositionOfMainContainer, yPositionOfMainContainer, widthOfMainContainer, heightOfMainContainer);
    
    for(int i = 0;i < imageViewList.count;i ++){
        UIImageView* currentImageView = imageViewList[i];
        
        currentImageView.frame = CGRectMake((CGFloat)i*(centeredImageViewWidth + horizontalSpacing), 0, centeredImageViewWidth, centeredImageViewHeight);
        
        currentImageView.alpha = i == currentIndex ? 1.0:0.3;
        
        [self.mainContainer addSubview:currentImageView];
    }
    
    [self setCornerRadiusForImageView:10.0];
    [self setShadowForImageView];
}

@end
