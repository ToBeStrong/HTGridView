//
//  WMGridView.h
//  
//
//  Created by sunchunlei on 16/4/17.
//
//

#import <UIKit/UIKit.h>
#import "WMGridViewCell.h"

@class WMGridView,WMGridViewCell;

@protocol WMGridViewDelegate  <NSObject>

@optional
/**
 *  选中某个Item
 *
 *  @param gridView GridView
 *  @param index    位置
 */
- (void)gridView:(WMGridView *)gridView didSelectedItemAtIndex:(NSInteger)index;

@end

@protocol WMGridViewDataSource <NSObject>

@required
/**
 *  获取item个数
 *
 *  @param gridView GridView
 *
 *  @return 在gridView中item个数
 */
- (NSInteger)numberOfItemsInGridView:(WMGridView *)gridView;
/**
 *  获取对应位置的cell
 *
 *  @param gridView gridView
 *  @param index    位置
 *
 *  @return 对应为的cell
 */
- (WMGridViewCell *)gridView:(WMGridView *)gridView cellForItemAtIndex:(NSInteger)index;

@optional
/**
 *  列数
 *
 *  @param gridView GridView
 *
 *  @return 最大列数
 */
- (NSInteger)maxColumnsInGridView:(WMGridView *)gridView;

@end

@interface WMGridView : UIView
/**
 *  列数
 */
@property (nonatomic, assign) NSInteger maxColumn;

/**
 *  代理
 */
@property (nonatomic, weak) id<WMGridViewDelegate> delegate;

/**
 *  数据源
 */
@property (nonatomic, weak) id<WMGridViewDataSource> dataSource;

/**
 *  刷新方法
 */
- (void)reloadData;

@end
