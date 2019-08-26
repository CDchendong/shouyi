//
//  NSError+EVDescription.h
//  AAAAFNetworking
//
//  Created by apple on 16/7/18.
//  Copyright © 2016年 ANGELEN. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSError (EVDescription)

- (NSInteger)evCode;
- (NSString *)evDescription;

@end
