//
//  SYShopSearchModel.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/7.
//  Copyright © 2019 eims. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef NS_ENUM(NSInteger,HistorySearchType) {
    HistorySearchSuplly = 0,
    HistorySearchMerchant,
    HistorySearchNeed
};
@interface SYShopSearchModel : NSObject

@property (strong,nonatomic) NSString * title;
@property (assign,nonatomic) HistorySearchType type;
+(instancetype)initWithTitle:(NSString *)title andType:(HistorySearchType)type;
- (void)encodeWithCoder:(NSCoder *)coder;
- (instancetype)initWithCoder:(NSCoder *)coder;
@end

NS_ASSUME_NONNULL_END
