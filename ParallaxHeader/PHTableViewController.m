//
//  PHTableViewController.m
//  ParallaxHeader
//
//  Created by cc on 15/12/22.
//  Copyright © 2015年 cc. All rights reserved.
//

#import "PHTableViewController.h"
#import "PHDemoHeader.h"

@interface PHTableViewController ()

@property (nonatomic, strong) PHDemoHeader *tableHeader;

@end

@implementation PHTableViewController

static NSString * const PH_CELL_REUSE_IDENTIFIER = @"PH_CELL_REUSE_IDENTIFIER";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tableView.tableHeaderView = self.tableHeader;
}

// MARK: table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:PH_CELL_REUSE_IDENTIFIER forIndexPath:indexPath];
    
    cell.imageView.image = [UIImage imageNamed:@"avatar"];
    cell.textLabel.text = @"我们是害虫, 我们是害虫";
    
    return cell;
}

// MARK: table view delegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 50;
}

// MARK: getters

- (PHDemoHeader *)tableHeader {
    if (!_tableHeader) {
        PHDemoHeader *header = [PHDemoHeader headerWithHeight:200];
        header.image = [UIImage imageNamed:@"tbt"];
        header.parallaxRatio = .6;
        _tableHeader = header;
    }
    return _tableHeader;
}

@end
