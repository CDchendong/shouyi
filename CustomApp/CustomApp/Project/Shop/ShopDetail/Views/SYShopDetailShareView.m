//
//  SYShopDetailShareView.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/16.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopDetailShareView.h"

@implementation SYShopDetailShareView
+ (instancetype)shareView{
     return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
}

@end
