//
//  HTTPDNSClient.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDNSRecord.h"

/**
 *  HTTP DNS Client
 */
@interface HTTPDNSClient : NSObject

/**
 *  HTTPDNSClient sharedInstance
 */
+ (HTTPDNSClient *)sharedInstance;

/**
 *  Clean record cache
 */
- (void)cleanAllCache;

/**
 *  Use DNSPod Provider
 */
- (void)useDNSPod;

/**
 *  Use Google DNS-over-HTTP Provider
 */
- (void)useGoogle;

/**
 *  Use AliYun Provider
 *
 *  @param key accound id from aliyun
 */
- (void)useAliYunWithKey:(NSString *)key;

/**
 *  Use DNSPod Pro Provider
 *
 *  @param account account id in DNSpod
 *  @param key     account key in DNSPod
 */
- (void)useDNSPodProWithAccount:(NSString *)account Key:(NSString *)key;

/**
 *  Get record from domain (nil if err or can't get)
 *
 *  @param domain   domain to request
 *  @param callback HTTPDNS callback
 */
- (void)getRecord:(NSString *)domain callback:(HTTPDNSCallback)callback;

@end
