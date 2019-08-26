//
//  NSObject+Extension.m
//  CustomApp
//
//  Created by CDchen on 2019/4/17.
//  Copyright © 2019 eims. All rights reserved.
//

#import "NSObject+Extension.h"

@implementation NSObject (Extension)
- (BOOL)isNotEmpty
{
    return !(self == nil
             || [self isKindOfClass:[NSNull class]]
             || ([self respondsToSelector:@selector(length)]
                 && [(NSData *)self length] == 0)
             || ([self respondsToSelector:@selector(count)]
                 && [(NSArray *)self count] == 0));
}
- (BOOL)isValided
{
    return !(self == nil || [self isKindOfClass:[NSNull class]]);
}
@end
