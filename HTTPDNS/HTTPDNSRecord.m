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
            _timeout = ttl + [HTTPDNSUtil getSecondTimestamp];
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
    return [NSString stringWithFormat:@"%@ %@ : %d in [ %@ ]",cached, _ip, _timeout, ips];
}

@end
