//
//  HTTPDNSHex.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/18/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  HTTPDNS NSData and Hex convert
 */
@interface HTTPDNSHex : NSObject

/**
 *  Encode hex from data
 *
 *  @param data data to encode
 *
 *  @return encoded string
 */
+ (NSString *)encodeHexData:(NSData *)data;

/**
 *  Encode hex from string
 *
 *  @param str string to encode
 *
 *  @return encoded string
 */
+ (NSString *)encodeHexString:(NSString *)str;


/**
 *  Decode hex from string
 *
 *  @param hex string to decode
 *
 *  @return decoded data
 */
+ (NSData *)decodeHexString:(NSString *)hex;

/**
 *  Decode hex to string
 *
 *  @param hex string to decode
 *
 *  @return decoded string
 */
+ (NSString *)decodeHexToString:(NSString *)hex;

@end
