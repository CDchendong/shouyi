//
//  SYShopDetailNormsView.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//
/**
 * 规格选择
 **/

#import "SYShopDetailNormsView.h"
#import "MLHorizontalCollectionViewFlowLayout.h"
#import "SYShopDetailNormsCell.h"

#define kMinimumLineSpacing 10.F
#define kMinimumInteritemSpacing 10.F
#define kSectionInsets UIEdgeInsetsMake(10.F, 10.F, 10.F, 10.F)
@interface SYShopDetailNormsView ()<MLHorizontalCollectionViewFlowLayoutDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSMutableArray *dataSource;

@property (nonatomic, copy)
void(^sizeCalculatedHandler)(CGSize size);
@property (nonatomic, assign) NSInteger currentNum;
@property (nonatomic, strong) NSIndexPath *selectIndexPath;

@end

@implementation SYShopDetailNormsView
+ (instancetype)detailNormsView{
    
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
    
}

- (void)awakeFromNib{
    [super awakeFromNib];
    _dataSource = [NSMutableArray arrayWithObjects:@"123123",@"123123",@"xvvxvxvxv",@"55456456546",@"123123",@"123123",@"xvvxvxvxv",@"55456456546",@"44",@"99999999999999999",nil];
    [self zc_initialSubviews];
    _currentNum = 1;
}

- (void)zc_initialSubviews {
    
    MLHorizontalCollectionViewFlowLayout *flowLayout = [[MLHorizontalCollectionViewFlowLayout alloc] init];
    flowLayout.horizonalType = MLHorizonalLeft;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = [UIColor whiteColor];
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SYShopDetailNormsCell class]) bundle:nil] forCellWithReuseIdentifier:@"SYShopDetailNormsCell"];
    [self.normsView addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.normsView);
    }];
    _collectionView = collectionView;
}

#pragma mark ------- 加号+减号-
- (IBAction)addActionBtn:(UIButton *)sender {
    _currentNum ++;
    self.numberLb.text = @(_currentNum).numberToString;
}

- (IBAction)reduceActionBtn:(UIButton *)sender {
   
    if (_currentNum <=0) {
        return;
    }else{
         _currentNum --;
        self.numberLb.text = @(_currentNum).numberToString;

    }
    
}

#pragma mark ----- 加入购物车 立即购买
- (IBAction)addInShopBtn:(UIButton *)sender {
    
}
- (IBAction)buyNowBtn:(UIButton *)sender {
}


#pragma mark - Public
- (void)reloadDataSource:(NSMutableArray *)dataSource idSource:(NSMutableArray *)idData sizeCalculated:(void(^)(CGSize size))calculated {
//    _sizeCalculatedHandler = calculated;
//    _dataSource = dataSource;
//    _idSource = idData;
    [self.collectionView reloadData];
}

#pragma mark - Collection view flow layout
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return kSectionInsets;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return kMinimumLineSpacing;
}

- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return kMinimumInteritemSpacing;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // String Length
    CGSize size = [self.dataSource[indexPath.item] stringSizeWithFont:[UIFont systemFontOfSize:13]];
    CGFloat itemW = ceilf(size.width) + 10.f * 2.f;
    CGFloat itemH = 30;
    return CGSizeMake(itemW, itemH);
}

- (void)collectionFlowLayout:(MLHorizontalCollectionViewFlowLayout *)flowLayout didCalculatedContentSize:(CGSize)size {
    NSLog(@"计算出尺寸%@", NSStringFromCGSize(size));
    if (self.sizeCalculatedHandler) {
        self.sizeCalculatedHandler(size);
    }
}

#pragma mark - Collection view data source
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return self.dataSource.count ? 1 : 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.dataSource.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SYShopDetailNormsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SYShopDetailNormsCell" forIndexPath:indexPath];
    cell.nameLb.text = self.dataSource[indexPath.item];

    return cell;
}

#pragma mark - Collection view delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    self.selectIndexPath = indexPath;
//    SYShopDetailNormsCell *cell = (SYShopDetailNormsCell *)[collectionView cellForItemAtIndexPath:indexPath];
//    [cell.nameLb setBackgroundColor:[UIColor greenColor]];
//    [cell.nameLb setTextColor:[UIColor redColor]];
    if ([self.delegate respondsToSelector:@selector(didclcikName:)]) {
        [self.delegate didclcikName:self.dataSource[indexPath.row]];
    }
}

@end
