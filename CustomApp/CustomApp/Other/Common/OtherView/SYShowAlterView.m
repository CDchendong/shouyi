//
//  SYShowAlterView.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/8.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYShowAlterView.h"
NSTimeInterval const kZCAlertViewDuration = 0.25F;

@interface SYShowAlterView ()
@property (nonatomic, weak) UIView *maskView;
@property (nonatomic, weak) UIView *centerContentView;
@property (nonatomic, weak) UIView *bottomContentView;

@property (nonatomic, assign) SYAlertViewContentType contentType;

@end

@implementation SYShowAlterView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initialSubviews];
    }
    return self;
}
- (void)initialSubviews {
    
    // MaskView
    UIView *maskView = [[UIView alloc] initWithFrame:self.bounds];
    maskView.backgroundColor = COLOR_HEXSA(@"#000000", 0.5f);
    [self addSubview:maskView];
    _maskView = maskView;
    
    // Content View
    UIView *centerContentView = [[UIView alloc] initWithFrame:CGRectZero];
    centerContentView.hidden = YES;
    [self addSubview:centerContentView];
    [centerContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.mas_centerX);
        make.centerY.equalTo(self.mas_centerY);
        make.left.greaterThanOrEqualTo(self.mas_left).offset(15.f);
        make.height.mas_greaterThanOrEqualTo(0.f);
    }];
    _centerContentView = centerContentView;
    
    // Bottom View
    UIView *bottomContentView = [[UIView alloc] initWithFrame:CGRectZero];
    bottomContentView.hidden = YES;
    [self addSubview:bottomContentView];
    [bottomContentView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self);
        make.height.mas_greaterThanOrEqualTo(0.f);
    }];
    _bottomContentView = bottomContentView;
    
}
+ (instancetype)showAlertViewWithType:(SYAlertViewContentType)type toView:(nullable UIView *)view config:(void(^)(UIView *contentView))config{
    if (view == nil) {
        view = [UIApplication sharedApplication].keyWindow;
    }
    SYShowAlterView *alertView = [[SYShowAlterView alloc] initWithFrame:view.bounds];
    alertView.contentType = type;
    [view addSubview:alertView];
    [alertView showAlertAnimated:YES config:config];
    return alertView;
}

- (void)showAlertAnimated:(BOOL)animated config:(void (^)(UIView * _Nonnull))config {
    switch (_contentType) {
        case SYAlertViewContentTypeCenter: {
            if (config) {
                config(self.centerContentView);
            }
            if (animated) {
                self.maskView.alpha = 0.f;
                self.centerContentView.alpha = 0.25f;
                self.centerContentView.transform = CGAffineTransformMakeScale(0.25f, 0.25f);
                [UIView animateWithDuration:kZCAlertViewDuration animations:^{
                    self.maskView.alpha = 1.f;
                    self.centerContentView.alpha = 1.f;
                    self.centerContentView.transform = CGAffineTransformIdentity;
                }];
            }
        }
            break;
        case SYAlertViewContentTypeBottom: {
            if (config) {
                config(self.bottomContentView);
            }
            [self.bottomContentView layoutIfNeeded];
            if (animated) {
                self.maskView.alpha = 0.f;
                self.bottomContentView.alpha = 0.25f;
                self.bottomContentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(self.bottomContentView.frame));
                [UIView animateWithDuration:kZCAlertViewDuration animations:^{
                    self.maskView.alpha = 1.f;
                    self.bottomContentView.alpha = 1.f;
                    self.bottomContentView.transform = CGAffineTransformIdentity;
                }];
            }
        }
            break;
    }
}

- (void)setContentType:(SYAlertViewContentType)contentType {
    _contentType = contentType;
    if (contentType == SYAlertViewContentTypeCenter) {
        self.centerContentView.hidden = NO;
    } else {
        self.bottomContentView.hidden = NO;
    }
}

- (void)dismissAnimated:(BOOL)animated {
    [self dismissAnimated:animated dismissed:nil];
}

- (void)dismissAnimated:(BOOL)animated dismissed:(void (^)(void))dismissed {
    if (animated) {
        [UIView animateWithDuration:kZCAlertViewDuration animations:^{
            self.maskView.alpha = 0.f;
            if (!self.centerContentView.hidden) {
                self.centerContentView.alpha = 0.25f;
                self.centerContentView.transform = CGAffineTransformMakeScale(0.25f, 0.25f);
            } else if (!self.bottomContentView.hidden) {
                self.bottomContentView.alpha = 0.25f;
                self.bottomContentView.transform = CGAffineTransformMakeTranslation(0, CGRectGetHeight(self.bottomContentView.frame));
            }
        } completion:^(BOOL finished) {
            [self.centerContentView removeFromSuperview];
            [self.bottomContentView removeFromSuperview];
            [self.maskView removeFromSuperview];
            if (dismissed) {
                dismissed();
            }
            [self removeFromSuperview];
        }];
    } else {
        [self removeFromSuperview];
    }
}

- (void)dealloc {
    NSLog(@"销毁提示效果%@", NSStringFromClass([self class]));
}


@end
