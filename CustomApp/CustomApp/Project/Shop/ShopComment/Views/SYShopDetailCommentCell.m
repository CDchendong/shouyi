//
//  SYShopDetailCommentCell.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/15.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopDetailCommentCell.h"

#import "SYShopDetailImageCell.h"
//列数
#define item_num 3
#define pading 10
@interface SYShopDetailCommentCell ()<UICollectionViewDelegate,UICollectionViewDataSource>
@property (nonatomic, strong) UIImageView * headImg;
@property (nonatomic, strong) UILabel * nameLb;
@property (nonatomic, strong) UILabel * timeLb;
@property (nonatomic, strong) UILabel * commentLb;
@property (nonatomic, strong) UICollectionView *collectionView;
// 评论赞
@property (nonatomic, strong) UIView * bottomView;
@property (nonatomic, strong) UILabel * numberLb;
@property (nonatomic, strong) UIButton *commentBtn;
@property (nonatomic, strong) UILabel * commentNum;
@property (nonatomic, strong) UIButton * praiseBtn;
@property (nonatomic, strong) UILabel * praiseLb;
@property (nonatomic, strong)     NSArray<NSString *> *pictures;
;

@end

@implementation SYShopDetailCommentCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self setUI];
        [self loadImage];
        [self getCollectionHeight];

    }
    return self;
}

- (void)loadImage {
    NSMutableArray *picArray = [NSMutableArray array];
    for (int i = 1; i < 5; i++) {
        NSString *imageName = [NSString stringWithFormat:@"pic_home_business_%d",i];
        [picArray addObject:imageName];
    }
    _pictures = picArray.copy;
}
- (void)setUI {
    
    self.headImg = [UIImageView new];
    self.headImg.image = kImageNamed(@"11111111");
    [self.contentView addSubview:self.headImg];
    [_headImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(16);
        make.top.mas_equalTo(8);
        make.height.width.mas_equalTo(34);
    }];
    self.nameLb = [UILabel new];
    self.nameLb.text = @"123123";
    self.nameLb.font = [UIFont systemFontOfSize:13];
    [self.contentView addSubview:self.nameLb];
    [_nameLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.left.equalTo(self.headImg.mas_right).offset(8);
        make.height.mas_equalTo(16);
    }];
    self.timeLb = [UILabel new];
    self.timeLb.text = @"20101023";
    self.timeLb.font = [UIFont systemFontOfSize:10];
    [self.contentView addSubview:self.timeLb];
    [_timeLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.nameLb.mas_bottom);
        make.left.equalTo(self.headImg.mas_right).offset(8);
        make.height.mas_equalTo(16);
    }];
    self.commentLb = [UILabel new];
    self.commentLb.text = @"123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123123";
    self.commentLb.numberOfLines = 0;
    [self.contentView addSubview:self.commentLb];
    [_commentLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.contentView).offset(58);
        make.right.equalTo(self.contentView).offset(-20);
        make.top.equalTo(self.timeLb.mas_bottom).offset(0);
    }];
   
    [self.contentView addSubview:self.collectionView];
    [_collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        
    make.top.equalTo(self.commentLb.mas_bottom).offset(10);
        make.left.equalTo(self.contentView).offset(58);
        make.right.equalTo(self.contentView.mas_right).offset(-20);
        make.height.mas_equalTo(@0).priorityLow();
    }];
    
    self.bottomView = [UIView new];
    [self.contentView addSubview:self.bottomView];
    
    [_bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(58);
        make.top.mas_equalTo(self.collectionView.mas_bottom);
        make.right.mas_equalTo(-20);
        make.height.mas_equalTo(35);
        make.bottom.equalTo(self.contentView).offset(0);
    }];
    _numberLb = [UILabel new];
    _numberLb.text = @"浏览123123";
    _numberLb.font = [UIFont systemFontOfSize:13];
    [self.bottomView addSubview:self.numberLb];
    [_numberLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.height.mas_equalTo(35);
        make.top.mas_equalTo(0);
    }];
    
    
    _praiseLb = [UILabel new];
    _praiseLb.text = @"123";
    _praiseLb.font = [UIFont systemFontOfSize:13];
    [self.bottomView addSubview:self.praiseLb];
    [_praiseLb mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(16);
    }];
    _praiseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_praiseBtn setImage:kImageNamed(@"icon_home_like_not_select") forState:UIControlStateNormal];
    [self.bottomView addSubview:self.praiseBtn];
    [_praiseBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.praiseLb.mas_left).offset(0);
        make.width.height.mas_equalTo(35);
        make.top.mas_equalTo(0);
    }];
    _commentNum = [UILabel new];
    _commentNum.text = @"123";
    _commentNum.font = [UIFont systemFontOfSize:13];
    [self.bottomView addSubview:self.commentNum];
    [_commentNum mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.praiseBtn.mas_left).offset(-15);
        make.top.mas_equalTo(10);
        make.height.mas_equalTo(16);
    }];
    
    _commentBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [_commentBtn setImage:kImageNamed(@"icon_home_comment") forState:UIControlStateNormal];
    [self.bottomView addSubview:self.commentBtn];
    [_commentBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.commentNum.mas_left).offset(0);
        make.width.and.height.mas_equalTo(35);
        make.top.mas_equalTo(0);
    }];
}

- (void)getCollectionHeight{
    [self.collectionView reloadData];
    [self.collectionView layoutIfNeeded];
    [self.collectionView setNeedsLayout];
    CGFloat height_pading;
    CGFloat height_collectionview;
    if (_pictures.count > 0) {
        height_pading = 15;
        height_collectionview = self.collectionView.collectionViewLayout.collectionViewContentSize.height;
    }else {
        height_pading = 0;
        height_collectionview = 5;
    }
    [self.collectionView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(height_collectionview-90)).priorityLow();

    }];
}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    
    return 5;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    // String Length
    
    CGFloat item_height = ([UIScreen mainScreen].bounds.size.width- 78 -((3+1)*pading))/3;
    CGSize size = CGSizeMake(item_height,item_height);
    return size;
}
//这个是两行cell之间的最小间距（上下行cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section{
    return 10;
}
//两个cell之间的最小间距间距（同一行的cell的间距）
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section{
    return 5;
    
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    SYShopDetailImageCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"SYShopDetailImageCell" forIndexPath:indexPath];
    for (int i =0; i<_pictures.count; i++) {
        cell.imageCell.image = kImageNamed(_pictures[i]);
    }
    
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
}

#pragma mark ------- 懒加载
- (UICollectionView *)collectionView{
    if (!_collectionView) {
        UICollectionViewFlowLayout * layout = [[UICollectionViewFlowLayout alloc]init];
        layout.scrollDirection = UICollectionViewScrollDirectionVertical;
        _collectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
        _collectionView.backgroundColor = [UIColor whiteColor];
        _collectionView.delegate=self;
        _collectionView.dataSource=self;
       
        [_collectionView registerNib:[UINib nibWithNibName:@"SYShopDetailImageCell" bundle:nil] forCellWithReuseIdentifier:@"SYShopDetailImageCell"];

    }
    return _collectionView;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
