//
//  NSDictionary+Null.h
//  ServerPeople
//
//  Created by 韦亚辉 on 2018/1/10.
//  Copyright © 2018年 zenith. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (Null)

/**把字典中的NSNull类型替换成@""*/

+(id)changeType:(id)myObj;

@end
