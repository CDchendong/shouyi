//
//  SYShopDetailCBottomView.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/16.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShopDetailCBottomView.h"

@implementation SYShopDetailCBottomView
+ (instancetype)commentBottomView{
    return [[[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil] firstObject];
}
- (void)awakeFromNib{
    [super awakeFromNib];
    self.praiseBtn.layer.borderWidth = 1;
    self.commentBtn.layer.borderWidth = 1;
    self.praiseBtn.layer.borderColor = COLOR_HEXS(@"#FF0336").CGColor;
    self.commentBtn.layer.borderColor =COLOR_HEXS(@"#FF0336").CGColor;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
