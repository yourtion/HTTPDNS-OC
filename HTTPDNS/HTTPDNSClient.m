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
#import "HTTPDNSGoogle.h"

@implementation HTTPDNSClient
{
    NSMutableDictionary *_cache;
    HTTPDNSBase *_provider;
}

- (instancetype)init
{
    @throw [NSException exceptionWithName:@"Do not init HTTPDNSClient"
                                   reason:@"You should use [HTTPDNSClient sharedInstance]"
                                 userInfo:nil];
    return nil;
}

+ (HTTPDNSClient *)sharedInstance
{
    static HTTPDNSClient*_sharedInstance = nil;
    static dispatch_once_t oncePredicate;
    dispatch_once(&oncePredicate, ^{
        _sharedInstance = [[HTTPDNSClient alloc] initPrivate];
    });
    return _sharedInstance;
}

- (instancetype)initPrivate {
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

- (void)useGoogle {
    [self cleanAllCache];
    _provider =  [[HTTPDNSGoogle alloc] init];
}


- (void)useAliYunWithKey:(NSString *)key {
    if (key) {
        [self cleanAllCache];
        _provider =  [[HTTPDNSAliYun alloc] initWithAccountId:key];
    }
}

- (void)useAliYunWithoutHTTPSWithKey:(NSString *)key {
    if (key) {
        [self cleanAllCache];
        HTTPDNSAliYun *dns = [[HTTPDNSAliYun alloc] initWithAccountId:key];
        [dns disableHTTPS];
        _provider = dns;
    }
}

- (void)useDNSPodProWithAccount:(NSString *)account Key:(NSString *)key {
    if (account && key) {
        [self cleanAllCache];
        _provider = [[HTTPDNSDNSPod alloc] initWithAccountId:account andKey:key];
    }
}

- (void)getRecord:(NSString *)domain callback:(HTTPDNSCallback)callback {
    if (![HTTPDNSUtil isHTTPEnable]) return callback(nil);
    HTTPDNSRecord *record = [_cache objectForKey:domain];
    if (record) {
        if (record.timeout > [[NSDate date] timeIntervalSince1970]) {
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
