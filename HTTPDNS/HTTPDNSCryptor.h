//
//  HTTPDNSCryptor.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/18/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPDNSCryptor : NSObject

- (instancetype)initWithKey:(NSString *)key;

- (NSData *)encrypt:(NSData *)data;
- (NSData *)decrpyt:(NSData *)data;

@end
