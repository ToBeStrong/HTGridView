//
//  ViewController.m
//  HTGridViewDemo
//
//  Created by sunchunlei on 16/4/17.
//  Copyright (c) 2016年 godHands. All rights reserved.
//

#import "ViewController.h"
#import "WMGridView.h"
#import "HTTestCell.h"

@interface ViewController ()<WMGridViewDataSource,WMGridViewDelegate>
@property (nonatomic, strong) NSMutableArray *dataArr;

@end

@implementation ViewController

- (NSMutableArray *)dataArr{
    if (_dataArr == nil) {
        _dataArr = [NSMutableArray array];
        NSArray *temp = @[@"哈哈哈",@"一个",@"非常",@"牛逼",@"的",@"view",@"一个",@"好困",@"are you ok",@"卧槽"];
        [_dataArr addObjectsFromArray:temp];
    }
    return _dataArr;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    WMGridView *gridView = [[WMGridView alloc] initWithFrame:CGRectMake(0, 100,320, 200)];
    gridView.backgroundColor = [UIColor yellowColor];
    
    gridView.dataSource = self;
    gridView.delegate = self;
    gridView.maxColumn = 3;
    [self.view addSubview:gridView];
    
    [gridView reloadData];
}

- (NSInteger)numberOfItemsInGridView:(WMGridView *)gridView{

    return self.dataArr.count;
}

- (WMGridViewCell *)gridView:(WMGridView *)gridView cellForItemAtIndex:(NSInteger)index{
    
    NSString *title = (NSString *)self.dataArr[index];
    HTTestCell *cell = [[HTTestCell alloc] init];
    cell.nameTitle = title;
    return cell;
}

- (void)gridView:(WMGridView *)gridView didSelectedItemAtIndex:(NSInteger)index{
    
    NSLog(@"%@",self.dataArr[index]);

}

@end
