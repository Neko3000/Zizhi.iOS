//
//  ViewController.m
//  Zizhi.iOS
//
//  Created by Xueliang Chen on 8/28/19.
//  Copyright © 2019 RoseAndCage. All rights reserved.
//

#import "ItemListViewController.h"
#import "UIButton+ImageTitleCentering.h"
#import "ItemListItemTableViewCell.h"

@interface ItemListViewController()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UIButton *categoryBtn;
@property (weak, nonatomic) IBOutlet UIButton *tagBtn;
@property (weak, nonatomic) IBOutlet UIButton *orderBtn;
@property (weak, nonatomic) IBOutlet UITableView *itemListTableView;

@end

@implementation ItemListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    
    // Set btns
    [self.tagBtn centerImageAndTitleWithSpacing:9.0];
    [self.orderBtn centerImageAndTitleWithSpacing:9.0];
    
    // Set TableView
    [self.itemListTableView registerNib:[UINib nibWithNibName:@"ItemListItemTableViewCell" bundle:nil] forCellReuseIdentifier:@"ItemListItemTableViewCell"];
    self.itemListTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    
    self.itemListTableView.delegate = self;
    self.itemListTableView.dataSource = self;
        
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier  isEqual: @"ItemListToItemDetail"]){
        
    }
}

// TableView Delegate

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 10;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return 10;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 192.0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    ItemListItemTableViewCell* specificCell = [tableView dequeueReusableCellWithIdentifier:@"ItemListItemTableViewCell"];
    
    [specificCell setCoverImage:[UIImage imageNamed:@"example-pic-1"]];
    
    [specificCell setName:@"黑檀"];
    [specificCell setSellerName:@"玉簪"];
    [specificCell setTag:@"黑檀，玉簪，珍珠，贝壳"];
    [specificCell setPrice:@"￥168.80"];
    [specificCell setNumber:@"第 1 品"];
    
    specificCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    UITableViewCell* cell = specificCell;
        
    return cell;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView* tempView = [[UIView alloc]init];
    tempView.backgroundColor = UIColor.clearColor;
    
    return tempView;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    
    return  19.0;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}

@end
