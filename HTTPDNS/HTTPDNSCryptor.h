//
//  HTTPDNSCryptor.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/18/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 HTTPDNS Cryptor (Now for DNSPod pro)
 
 - returns: Cryptor instance
 */
@interface HTTPDNSCryptor : NSObject

/**
 *  init for instance
 *
 *  @param key encrypt or decrypt key
 *
 *  @return Cryptor instance
 */
- (instancetype)initWithKey:(NSString *)key;

/**
 *  Encrypt Data
 *
 *  @param data data to encrypt
 *
 *  @return Encrypted data
 */
- (NSData *)encrypt:(NSData *)data;

/**
 *  Decrpyt Data
 *
 *  @param data data to decrpyt
 *
 *  @return Decrpyted data
 */
- (NSData *)decrpyt:(NSData *)data;

@end
