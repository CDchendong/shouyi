//
//  BaseTableViewVC.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/19.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface BaseTableViewVC : UIViewController<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,strong) UITableView *tableView;

@property (nonatomic,assign) NSInteger page;

@property (nonatomic,strong) NSMutableArray *dataArray;


/**
 *  无内容视图
 */
@property (nonatomic,strong)UIView *noDataImageView;

/** 添加刷新*/
- (void)addRefresh;

/** 转圆圈加载*/
//- (void)addGifRefresh;

/** 上拉刷新、下拉刷新加载数据*/
- (void)startRequest;



-(void)updateMJRefreshStateWithPage:(NSInteger)page andDataArray:(NSArray *)dataArray;

/**
 * 更新tableview的 RefreshState
 * @param page self.page
 * @param dataArray 最新加载下来的数据源
 * @param pageCountStr 每页数据的条数 为nil 则 为 10
 */
-(void)updateMJRefreshStateWithPage:(NSInteger)page andDataArray:(NSArray *)dataArray everyPageCount:(nullable NSString *)pageCountStr;

-(void)checkDataSource:(NSArray *)sources andNoDataTitle:(NSString *)title andParentView:(nullable UIView *)view;

-(void)checkDataSource:(NSArray *)sources andNoDataTitle:(NSString *)title andParentView:(nullable UIView *)view andImageName:(NSString *)imageName;

@end

NS_ASSUME_NONNULL_END
