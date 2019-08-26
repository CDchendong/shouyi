//
//  SYCodeBtn.m
//  CustomApp
//
//  Created by Dong Chen on 2019/8/6.
//  Copyright © 2019 eims. All rights reserved.
//

#import "SYCodeBtn.h"
NSString * const kAuthCodeTitle = @"获取验证码";
NSString * const kAuthCodeResendTitle = @"重新发送";
NSUInteger const kAuthCodeDuration = 60;
@interface SYCodeBtn ()
{
    dispatch_source_t _timer;
    __block NSUInteger _count;
}
@end

@implementation SYCodeBtn
@synthesize restBgColor = _restBgColor;
@synthesize workBgColor = _workBgColor;
@synthesize restTitleColor = _restTitleColor;
@synthesize workTitleColor = _workTitleColor;


- (void)setRestBgColor:(UIColor *)restBgColor {
    _restBgColor = restBgColor;
    if (self.enabled) {
        self.backgroundColor = _restBgColor;
    }
}

- (void)setWorkBgColor:(UIColor *)workBgColor {
    _workBgColor = workBgColor;
    if (!self.enabled) {
        self.backgroundColor = _workBgColor;
    }
}

- (void)setRestTitleColor:(UIColor *)restTitleColor {
    _restTitleColor = restTitleColor;
    if (self.enabled) {
        [self setTitleColor:_restTitleColor forState:UIControlStateNormal];
    }
}

- (void)setWorkTitleColor:(UIColor *)workTitleColor {
    _workTitleColor = workTitleColor;
    if (!self.enabled) {
        [self setTitleColor:_workTitleColor forState:UIControlStateNormal];
    }
}

- (void)setEnabled:(BOOL)enabled {
    [super setEnabled:enabled];
    if (enabled) { // On rest state
        self.backgroundColor = self.restBgColor;
        [self setTitleColor:self.restTitleColor forState:UIControlStateNormal];
    } else { // On work state
        self.backgroundColor = self.workBgColor;
        [self setTitleColor:self.workTitleColor forState:UIControlStateNormal];
    }
}

#pragma mark - Getter

- (UIColor *)restTitleColor {
    if (!_restTitleColor) {
        _restTitleColor = COLOR_HEXS(@"#666666");
    }
    return _restTitleColor;
}

- (UIColor *)workTitleColor {
    if (!_workTitleColor) {
        _workTitleColor = COLOR_HEXS(@"#666666");
    }
    return _workTitleColor;
}

- (UIColor *)restBgColor {
    if (!_restBgColor) {
        _restBgColor =[UIColor whiteColor];
    }
    return _restBgColor;
}

- (UIColor *)workBgColor {
    if (!_workBgColor) {
        _workBgColor = [UIColor whiteColor];
    }
    return _workBgColor;
}

#pragma mark - Timer Public

- (void)resume {
    if (_timer) return;
    
    _count = kAuthCodeDuration;
    dispatch_source_t timer = dispatch_source_create(DISPATCH_SOURCE_TYPE_TIMER, 0, 0, dispatch_get_global_queue(0, 0));
    dispatch_source_set_timer(timer, DISPATCH_TIME_NOW, 1.F * NSEC_PER_SEC, 0 * NSEC_PER_SEC);
    WeakSelf(self);
    dispatch_source_set_event_handler(timer, ^{
        StrongSelf(self);
        if (self->_count > 0) {
            dispatch_async(dispatch_get_main_queue(), ^{
                
                [self setTitle:[NSString stringWithFormat:@"%@s%@", @(self->_count),kAuthCodeResendTitle] forState:UIControlStateNormal];
                self.enabled = NO;
                self->_count--;
            });
        } else {
            dispatch_async(dispatch_get_main_queue(), ^{
                [self setTitle:kAuthCodeTitle forState:UIControlStateNormal];
                self.enabled = YES;
            });
            dispatch_cancel(timer);
            self->_timer = nil;
        }
    });
    dispatch_resume(timer);
    _timer = timer;
}

- (void)cancel {
    if (_timer) {
        dispatch_cancel(_timer);
        _timer = nil;
    }
    dispatch_async(dispatch_get_main_queue(), ^{
        [self setTitle:kAuthCodeTitle forState:UIControlStateNormal];
        self.enabled = YES;
    });
}

- (void)dealloc {
    if (_timer) {
        dispatch_cancel(_timer);
        _timer = nil;
    }
}
@end
