//
//  SYSearchTextField.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/6.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYSearchTextField.h"

@interface SYSearchTextField ()<UITextFieldDelegate>
{
    UIImageView *_searchLogo;
    
}
@end
@implementation SYSearchTextField
- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setUp];
    }
    return self;
}
- (void)awakeFromNib{
    [super awakeFromNib];
}
- (void)setUp{
    self.delegate = self;
    self.returnKeyType = UIReturnKeySearch;
    _searchLogo = [[UIImageView alloc]init];
    _searchLogo.image = [UIImage imageNamed:@"icon_search_gray"];
    _searchLogo.frame = CGRectMake(0, 0, 15, 15);
    self.leftView = _searchLogo;
    self.leftViewMode = UITextFieldViewModeAlways;
    self.placeholder = @"大家都在搜索";
    self.clearButtonMode = UITextFieldViewModeAlways;
    
}

- (void)setLogoColor:(UIColor *)logoColor{
    _logoColor = logoColor;
    _searchLogo.image = [UIImage imageNamed:@"icon_search_gray"];
}

- (CGRect)leftViewRectForBounds:(CGRect)bounds{
    CGRect rect = [super leftViewRectForBounds:bounds];
    rect.origin.x = 15;
    return rect;
}


- (CGRect)textRectForBounds:(CGRect)bounds{
    CGRect rect = [super textRectForBounds:bounds];
    rect.origin.x += 8;
    rect.size.width -= 10;
    return rect;
}
- (CGRect)editingRectForBounds:(CGRect)bounds{
    CGRect rect = [super textRectForBounds:bounds];
    rect.origin.x += 8;
    return rect;
}


- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    [textField resignFirstResponder];
    if(self.searchBlock && textField.text.length){
        self.searchBlock(textField.text);
    }
    return YES;
}
- (BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if(self.clickSeachBlock){
        self.clickSeachBlock();
        return NO;
    }
    return YES;
}
@end
