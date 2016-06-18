//
//  HTTPDNSHex.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/18/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPDNSHex : NSObject

+ (NSString *)encodeHexData:(NSData *)data;
+ (NSString *)encodeHexString:(NSString *)str;

+ (NSData *)decodeHexString:(NSString *)hex;
+ (NSString *)decodeHexToString:(NSString *)hex;

@end
