//
//  PHTableViewController.m
//  ParallaxHeader
//
//  Created by cc on 15/12/22.
//  Copyright © 2015年 cc. All rights reserved.
//

#import "PHTableViewController.h"
#import "PHDemoHeader.h"
#import "PHTimelineModel.h"
#import "PHSegmentedControl.h"
#import "PHDemoCell.h"
#import "TherbligsViewModel.h"
#import "IntroViewModel.h"

@interface PHTableViewController ()<PHSegmentedControlDelegate>

@property (nonatomic, strong) PHDemoHeader *tableHeader;
@property (nonatomic, strong) id<PHTimelineModel> timeLineModel;

/**
 * 实际数据来源
 */
@property (nonatomic, strong) TherbligsViewModel *therbligsVM;
@property (nonatomic, strong) IntroViewModel *introVM;

@end

@implementation PHTableViewController

static NSString * const PH_CELL_REUSE_IDENTIFIER = @"PH_CELL_REUSE_IDENTIFIER";

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.tableView registerClass:[PHDemoCell class] forCellReuseIdentifier:PH_CELL_REUSE_IDENTIFIER];

    self.tableView.tableHeaderView = self.tableHeader;
}

// MARK: segmented control delegate

- (void)ph_segmentedControl:(PHSegmentedControl *)segmentedControl didSelectedItemAtIndex:(NSInteger)index {
    switch (index) {
        case 0:
            self.timeLineModel = self.therbligsVM;
            break;
        case 1:
            self.timeLineModel = self.introVM;
            break;
            
        default:
            break;
    }
    
    /**
     * 可根据需要，选择部分刷新timeline, 或者如下, 暴力刷新整张表. 不过通常需要记录上一次浏览位置(offset)
     */
    [self.tableView reloadData];
}

// MARK: the cell

- (void)configureCell:(__kindof UITableViewCell *)aCell atIndexPath:(NSIndexPath *)indexPath {
    id<PHTimelineData> dataItem = [self.timeLineModel dataItemAtIndexPath:indexPath];
    
    // custom...
    
    PHDemoCell *cell = (PHDemoCell *)aCell;
    cell.thumbnail.image = dataItem.avatar;
    cell.titleLabel.text = dataItem.title;
    cell.contentLabel.text = dataItem.content;
}

// MARK: table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [self.timeLineModel numberOfSections];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.timeLineModel numberOfItemsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    PHDemoCell *cell = [tableView dequeueReusableCellWithIdentifier:PH_CELL_REUSE_IDENTIFIER forIndexPath:indexPath];
    
    [self configureCell:cell atIndexPath:indexPath];
    
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

- (TherbligsViewModel *)therbligsVM {
    if (!_therbligsVM) {
        TherbligsViewModel *vm = [TherbligsViewModel new];
        
        // do the neccessary data binding
        // ...
        
        _therbligsVM = vm;
    }
    return _therbligsVM;
}

- (IntroViewModel *)introVM {
    if (!_introVM) {
        IntroViewModel *vm = [IntroViewModel new];
        
        // do the neccessary data binding
        // ...
        
        _introVM = vm;
    }
    return _introVM;
}

@end
