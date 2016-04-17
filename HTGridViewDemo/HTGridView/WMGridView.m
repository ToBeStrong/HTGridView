//
//  WMGridView.m
//  
//
//  Created by sunchunlei on 16/4/17.
//
//

#import "WMGridView.h"


@interface WMGridView ()
@property (nonatomic, strong) NSMutableArray *cellArray;
@property (nonatomic, strong) WMGridViewCell *gridViewCell;
;
@end

@implementation WMGridView
{
    NSInteger _numberOfItem;
    NSInteger _maxColumn;
}

- (NSMutableArray *)cellArray{
    if (_cellArray == nil) {
        _cellArray = [NSMutableArray array];
    }
    return _cellArray;
}

- (instancetype)initWithFrame:(CGRect)frame{

    self = [super initWithFrame:frame];
    if (self) {
        // 默认列数
        _maxColumn = 5;
    }
    return self;
}

- (void)setMaxColumn:(NSInteger)maxColumn{
    
    _maxColumn = maxColumn;
}

- (void)reloadData{
    
    NSAssert(self.dataSource,@"请设置数据源");
    
    // 清空之前的数据
    [self.cellArray removeAllObjects];
    
    // 获取item个数
    _numberOfItem = [self.dataSource numberOfItemsInGridView:self];
    
    for (NSInteger i = 0; i < _numberOfItem; i++) {
        
        // 获取cell并保存
        self.gridViewCell = [self.dataSource gridView:self cellForItemAtIndex:i];
        
        [self.cellArray addObject:self.gridViewCell];
    }
    
    // 获取自定义列数
    if ([self.dataSource respondsToSelector:@selector(maxColumnsInGridView:)]) {
        _maxColumn = [self.dataSource maxColumnsInGridView:self];
    }
    
    [self layoutGridCells];
}

- (void)layoutGridCells{
    
    CGFloat inset = 15; // 边距
    CGFloat gap = 10; // 间距
    CGFloat itemH = 20;
    CGFloat itemW = (self.frame.size.width - 2 * inset - (_maxColumn - 1) * gap) / _maxColumn;

    for (NSInteger i = 0; i < self.cellArray.count; i++) {
        // frame
        WMGridViewCell *cell = (WMGridViewCell *)self.cellArray[i];
        cell.index = i;
        CGFloat itemX = inset + (i % _maxColumn) * (itemW + gap);
        CGFloat itemY = (i / _maxColumn) * (itemH + gap);
        cell.frame = CGRectMake(itemX, itemY, itemW, itemH);
        
        [cell addTarget:self action:@selector(cellDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:cell];
    }
}

- (void)cellDidClick:(WMGridViewCell *)cell{
    
    if ([self.delegate respondsToSelector:@selector(gridView:didSelectedItemAtIndex:)]) {
        [self.delegate gridView:self didSelectedItemAtIndex:cell.index];
    }
}


- (void)initGridView{
    
    for (WMGridViewCell *cell in self.subviews) {
        if ([cell isKindOfClass:[WMGridViewCell class]]) {
            [cell removeFromSuperview];
        }
    }
}

@end



