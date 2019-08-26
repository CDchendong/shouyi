//
//  UIView+Extension.h
//  CustomApp
//
//  Created by CDchen on 2019/4/17.
//  Copyright © 2019 eims. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface UIView (Extension)
@property (nonatomic, assign) CGFloat x;
@property (nonatomic, assign) CGFloat y;
@property (nonatomic, assign) CGFloat centerX;
@property (nonatomic, assign) CGFloat centerY;
@property (nonatomic, assign) CGFloat ww;//width
@property (nonatomic, assign) CGFloat hh;//height
@property (nonatomic, assign) CGFloat bbottom;
@property (nonatomic, assign) CGFloat rright;
@property (nonatomic, assign) CGSize ss;//size
@end

NS_ASSUME_NONNULL_END
