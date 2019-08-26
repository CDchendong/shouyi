//
//  SYShopSearchHotCell.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopSearchHotCell.h"
#import "MLHorizontalCollectionViewFlowLayout.h"
#import "SYShopSearchHotCollCell.h"

#define kMinimumLineSpacing 10.F
#define kMinimumInteritemSpacing 10.F
#define kSectionInsets UIEdgeInsetsMake(10.F, 10.F, 10.F, 10.F)

@interface SYShopSearchHotCell ()<MLHorizontalCollectionViewFlowLayoutDelegate, UICollectionViewDelegate, UICollectionViewDataSource>
@property (nonatomic, weak) UICollectionView *collectionView;
@property (nonatomic, strong) NSArray<NSString *> *dataSource;
@property (nonatomic, strong) NSArray<NSString *> *idSource;
@property (nonatomic, copy)
void(^sizeCalculatedHandler)(CGSize size);
@end
@implementation SYShopSearchHotCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self zc_initialSubviews];
    }
    return self;
}

- (void)zc_initialSubviews {
    
    MLHorizontalCollectionViewFlowLayout *flowLayout = [[MLHorizontalCollectionViewFlowLayout alloc] init];
    flowLayout.horizonalType = MLHorizonalLeft;
    
    UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:flowLayout];
    collectionView.dataSource = self;
    collectionView.delegate = self;
    collectionView.backgroundColor = COLOR_HEXS(@"#F5F8FA");
    [collectionView registerNib:[UINib nibWithNibName:NSStringFromClass([SYShopSearchHotCollCell class]) bundle:nil] forCellWithReuseIdentifier:@"SYShopSearchHotCollCell"];
    [self.contentView addSubview:collectionView];
    [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView);
    }];
    _collectionView = collectionView;
}

#pragma mark - Public
- (void)reloadDataSource:(NSMutableArray *)dataSource idSource:(NSMutableArray *)idData sizeCalculated:(void(^)(CGSize size))calculated {
    _sizeCalculatedHandler = calculated;
    _dataSource = dataSource;
    _idSource = idData;
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
    SYShopSearchHotCollCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SYShopSearchHotCollCell" forIndexPath:indexPath];
    cell.titleLB.text = self.dataSource[indexPath.item];
    return cell;
}

#pragma mark - Collection view delegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    if ([self.delegate respondsToSelector:@selector(didclcikName:)]) {
        [self.delegate didclcikName:self.dataSource[indexPath.row]];
    }
}

@end
