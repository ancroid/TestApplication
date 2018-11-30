//
//  SquareViewController.m
//  DemoApplication
//
//  Created by chenrui on 2018/11/27.
//  Copyright © 2018 chenrui. All rights reserved.
//

#import "SquareViewController.h"

@interface SquareViewController ()<UITableViewDataSource, UITableViewDelegate>

@property(nonatomic, strong) UITableView *tableView;
@property (nonatomic, copy) NSArray *cellInfo;
@end

@implementation SquareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initData];
    [self initTabelView];

}

-(void) initTabelView{
    _tableView=[[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    
    [self.view addSubview:_tableView];
    
}

-(void) initData{
    _cellInfo = @[@"view层",@"model层",@"controller层",@"mvc模式"];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _cellInfo.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"tableCell"];
    if (cell==nil) {
        cell=[[UITableViewCell alloc] initWithStyle:(UITableViewCellStyleValue1) reuseIdentifier:@"tableCell"];
    }
    cell.textLabel.text=[_cellInfo objectAtIndex:indexPath.row];
    cell.detailTextLabel.text=@"test";
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"%@", @(indexPath.row).stringValue);
}

@end
