//
//  HTTPDNSRecord.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  HTTP DNS Record
 */
@interface HTTPDNSRecord : NSObject
/// IP address
@property (nonatomic, strong, readonly) NSString *ip;
/// IP array
@property (nonatomic, readonly) NSArray *ips;
/// timeout
@property (nonatomic, readonly) NSTimeInterval timeout;
/// is Cached
@property (nonatomic, readonly) BOOL cached;

/**
 *  Init
 *
 *  @param ips IP array
 *  @param ttl Time To Live
 *
 *  @return DNSRecord
 */
- (instancetype)init:(NSArray *)ips ttl:(int)ttl;

/**
 *  Set record is cached
 *
 *  @param cached isCached
 */
- (void) setCached:(BOOL)cached;

/**
 *  Get record info
 *
 *  @return description for record
 */
- (NSString *)description;

@end

/**
 *  HTTPDNS Callback block
 *
 *  @param record Result (nil if didn't have)
 */
typedef void(^HTTPDNSCallback)(HTTPDNSRecord *record);
