//
//  SYShopDetailBottomView.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopDetailBottomView.h"

@implementation SYShopDetailBottomView
+ (instancetype)memberFooter {
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.numberLb.layer.borderWidth = 0.5;
    self.numberLb.layer.borderColor = COLOR_HEXS(@"#FF0336").CGColor;
    self.numberLb.layer.masksToBounds = YES;
   
}
- (IBAction)buyss:(id)sender {
    
}

@end
