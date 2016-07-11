//
//  HTTPDNSUtil.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDNSCryptor.h"

/**
 *  HTTPDNS Utils
 */
@interface HTTPDNSUtil : NSObject

/**
 *  check app is enable http
 *
 *  @return http enable
 */
+ (BOOL)isHTTPEnable;


/**
 *  Encrypt domain for request
 *
 *  @param domain  domain to encrypt
 *  @param cryptor HTTPDNSCryptor with key init first
 *
 *  @return encrypted string
 */
+ (NSString *)encrypt:(NSString *)domain withCryptor:(HTTPDNSCryptor *)cryptor;


/**
 *  Decrypt request data
 *
 *  @param raw     HTTP requset data
 *  @param cryptor HTTPDNSCryptor with key init first
 *
 *  @return decrypted string
 */
+ (NSString *)decrypt:(NSData *)raw withCryptor:(HTTPDNSCryptor *)cryptor;

@end
