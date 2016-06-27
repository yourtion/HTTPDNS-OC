//
//  HTTPDNSRecord.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSRecord.h"
#import "HTTPDNSUtil.h"

@implementation HTTPDNSRecord

- (instancetype)init:(NSArray *)ips ttl:(int)ttl {
    if (self = [super init]) {
        if ([ips count] > 0) {
            _ip = ips[0];
            _ips = ips;
            _timeout = ttl * 1000 + [[NSDate date] timeIntervalSince1970];
            _cached = YES;
        }
    }
    return self;
}

- (instancetype)init:(NSArray *)ips timeout:(NSTimeInterval)timeout {
    if (self = [super init]) {
        if ([ips count] > 0) {
            _ip = ips[0];
            _ips = ips;
            _timeout = timeout;
            _cached = YES;
        }
    }
    return self;
}

-(void)setCached:(BOOL)cached {
    _cached = cached;
}

- (NSString *)description {
    NSString *cached = _cached ? @"Cached" : @"";
    NSString *ips = [_ips componentsJoinedByString:@" | "];
    return [NSString stringWithFormat:@"%@ %@ : %f in [ %@ ]",cached, _ip, _timeout, ips];
}

- (instancetype)copyWithZone:(NSZone *)zone {
    HTTPDNSRecord *copy = [[[self class] allocWithZone:zone] init:_ips timeout:_timeout];
    return copy;
}

@end
