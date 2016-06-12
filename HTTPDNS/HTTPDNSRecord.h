//
//  HTTPDNSRecord.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPDNSRecord : NSObject

@property (nonatomic, strong, readonly) NSString *ip;
@property (nonatomic, readonly) NSArray *ips;
@property (nonatomic, readonly) int timeout;
@property (nonatomic, readonly) BOOL cached;

- (instancetype)init:(NSArray *)ips ttl:(int)ttl;
- (void) setCached:(BOOL)cached;
- (NSString *)description;

@end
