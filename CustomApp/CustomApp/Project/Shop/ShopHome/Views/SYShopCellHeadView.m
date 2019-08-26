//
//  SYShopCellHeadView.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/6.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopCellHeadView.h"

@implementation SYShopCellHeadView

- (instancetype)initWithFrame:(CGRect)frame {
    
    self = [super initWithFrame:frame];
    self = [[[NSBundle mainBundle] loadNibNamed:@"SYShopCellHeadView" owner:self options:nil] lastObject];
    if (self) {
        self.frame = frame;
    }
    return self;
}

@end
