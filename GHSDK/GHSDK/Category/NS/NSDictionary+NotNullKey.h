//
//  NSDictionary+NSDictionary_NotNullKey.h
//  HeadLine
//
//  Created by Ohw Althrun on 12-7-24.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <objc/runtime.h>

#define NILORSLASH(obj) (obj != nil) ? obj : @"/"
#define NILORDASH(obj)  (obj != nil) ? obj : @"-"

@interface NSDictionary (NotNullKey)
/**把 NSObject 转为 NSDictionary**/
+(NSDictionary *) dictionaryWithPropertiesOfObject:(id) obj;

/**in case of [NSNull null] values a nil is returned ...**/
- (id)objectForSafeKey:(id)key;

@end
