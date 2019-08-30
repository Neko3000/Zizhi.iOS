//
//  ItemListItemTableViewCell.m
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/29/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import "ItemListItemTableViewCell.h"
#import "ReshapableImageView.h"
#import "CALayer+SketchShadow.h"

@interface ItemListItemTableViewCell()

@property (weak, nonatomic) IBOutlet ReshapableImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *sellerNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *tagLabel;
@property (weak, nonatomic) IBOutlet UILabel *priceLabel;
@property (weak, nonatomic) IBOutlet UILabel *numberLabel;

@property (weak, nonatomic) IBOutlet UIView *blockShadowCasterView;
@property (weak, nonatomic) IBOutlet UIView *blockContainerView;

@end

@implementation ItemListItemTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    
    [self setup];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    // Configure the view for the selected state
    
}

- (void)setup{
    if(!isInitialized){
        [self.coverImageView setCornerRadius:40.0];
        [self.coverImageView.layer applySketchShadow:[UIColor colorNamed:@"Shadow-NormalRedGrey"] alpha:1.0 x:7.0 y:7.0 blur:17.0 spread:0];
        
        self.blockShadowCasterView.layer.cornerRadius = 6;
        [self.blockShadowCasterView.layer applySketchShadow:[UIColor colorNamed:@"Shadow-LightBlue"] alpha:1.0 x:0 y:16.0 blur:18.0 spread:0];
        
        self.nameLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"黑檀" attributes:@{NSKernAttributeName:@(2.4)}];
        self.sellerNameLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"玉簪记" attributes:@{NSKernAttributeName:@(1.65)}];
        self.tagLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"黑檀，玉簪，珍珠，贝壳" attributes:@{NSKernAttributeName:@(1.65)}];
        self.priceLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"￥168.80" attributes:@{NSKernAttributeName:@(2)}];
        self.numberLabel.attributedText = [[NSMutableAttributedString alloc] initWithString:@"第 1 品" attributes:@{NSKernAttributeName:@(1.5)}];
        
        isInitialized = YES;
    }
}

- (void)setCoverImage:(UIImage *)image{
    [self.coverImageView setImage:image];
    [self.coverImageView setCornerRadius:40.0];
}

- (void)setName:(NSString *)name{
    [((NSMutableAttributedString*)self.nameLabel.attributedText).mutableString setString:name];
}

- (void)setSellerName:(NSString *)seller{
    [((NSMutableAttributedString*)self.sellerNameLabel.attributedText).mutableString setString:seller];
}

- (void)setTag:(NSString *)tag{
    [((NSMutableAttributedString*)self.tagLabel.attributedText).mutableString setString:tag];
}

- (void)setPrice:(NSString *)price{
    [((NSMutableAttributedString*)self.priceLabel.attributedText).mutableString setString:price];
}

- (void)setNumber:(NSString *)number{
    [((NSMutableAttributedString*)self.numberLabel.attributedText).mutableString setString:number];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    
}

@end
