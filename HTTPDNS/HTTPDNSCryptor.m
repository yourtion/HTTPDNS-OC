//
//  HTTPDNSCryptor.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/18/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSCryptor.h"
#import <CommonCrypto/CommonCryptor.h>

@implementation HTTPDNSCryptor
{
    NSData *_key;
}

- (instancetype)initWithKey:(NSString *)key {
    if (!key || [key isEqualToString:@""]) {
        return nil;
    }
    if (self = [super init]) {
        _key = [key dataUsingEncoding:NSUTF8StringEncoding];
    }
    return self;
}

- (NSData *)encrypt:(NSData *)data {
    return [self cryptoOperation:kCCEncrypt data:data];
}

- (NSData *)decrpyt:(NSData *)data {
    return [self cryptoOperation:kCCDecrypt data:data];
}

-(NSData *)cryptoOperation:(CCOperation)opt data:(NSData *)data {
    const void *input = data.bytes;
    size_t inputSize = data.length;
    size_t bufferSize = 1024;
    
    if (opt == kCCEncrypt) {
        bufferSize = (inputSize + kCCBlockSize3DES) & ~(kCCBlockSize3DES - 1);
    }
    
    uint8_t *buffer = malloc(bufferSize * sizeof(uint8_t));
    
    memset((void *)buffer, 0x0, bufferSize);
    size_t movedBytes = 0;
    
    const void *vkey = _key.bytes;
    
    CCCryptorStatus ccStatus = CCCrypt(opt,
                                       kCCAlgorithmDES,
                                       kCCOptionECBMode | kCCOptionPKCS7Padding,
                                       vkey,
                                       kCCKeySizeDES,
                                       NULL,
                                       input,
                                       inputSize,
                                       (void *)buffer,
                                       bufferSize,
                                       &movedBytes);
    
    if (ccStatus != kCCSuccess) {
        NSLog(@"error code %d", ccStatus);
        free(buffer);
        return nil;
    }
    
    NSData *result = [NSData dataWithBytes:(const void *)buffer length:(NSUInteger)movedBytes];
    free(buffer);
    return result;
}

@end
