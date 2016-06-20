//
//  HTTPDNSClient.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSClient.h"
#import "HTTPDNSUtil.h"
#import "HTTPDNSDNSPod.h"
#import "HTTPDNSAliYun.h"
#import "HTTPDNSDNSPodPro.h"

@implementation HTTPDNSClient
{
    NSMutableDictionary *_cache;
    HTTPDNSBase *_provider;
}

- (instancetype)init {
    self = [super init];
    if (self) {
        _cache = [[NSMutableDictionary alloc] init];
        _provider = [[HTTPDNSDNSPod alloc] init];
    }
    return self;
}

- (void)cleanAllCache {
    [_cache removeAllObjects];
}

- (void)useDNSPod {
    [self cleanAllCache];
    _provider = [[HTTPDNSDNSPod alloc] init];
}

- (void)useAliYunWithKey:(NSString *)key {
    if (key) {
        [self cleanAllCache];
        _provider =  [[HTTPDNSAliYun alloc] initWithAccountId:key];
    }
}

- (void)useDNSPodProWithAccount:(NSString *)account Key:(NSString *)key {
    if (account && key) {
        [self cleanAllCache];
        _provider = [[HTTPDNSDNSPodPro alloc] initWithAccountId:account andKey:key];
    }
}

- (void)getRecord:(NSString *)domain callback:(HTTPDNSCallback)callback {
    if (![HTTPDNSUtil isHTTPEnable]) return callback(nil);
    HTTPDNSRecord *record = [_cache objectForKey:domain];
    if (record) {
        if (record.timeout > [HTTPDNSUtil getSecondTimestamp]) {
            return callback(record);
        } else {
            [_cache removeObjectForKey:domain];
        }
    }
    [_provider requsetRecord:domain callback:^(HTTPDNSRecord *ret) {
        if (ret && [ret.ips count] > 0) {
            [_cache setObject:[ret copy] forKey:domain];
            [ret setCached:NO];
            callback(ret);
        } else {
            callback(nil);
        }
    }];
}

@end
