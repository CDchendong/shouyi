//
//  SYRegisterVC.h
//  CustomApp
//
//  Created by Dong Chen on 2019/8/5.
//  Copyright © 2019 eims. All rights reserved.
//

#import "BaseViewVC.h"
#import "SYCodeBtn.h"
NS_ASSUME_NONNULL_BEGIN

@interface SYRegisterVC : BaseViewVC
@property (weak, nonatomic) IBOutlet UIButton *registBtn;
@property (weak, nonatomic) IBOutlet SYCodeBtn *codeBtn;

@end

NS_ASSUME_NONNULL_END
