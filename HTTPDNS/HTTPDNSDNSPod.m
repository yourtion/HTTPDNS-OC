//
//  HTTPDNSDNSPod.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/12/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSDNSPod.h"
#import "HTTPDNSCryptor.h"
#import "HTTPDNSUtil.h"

@implementation HTTPDNSDNSPod
{
    BOOL _isEnterprise;
    NSString *_id;
    NSString *_server;
    HTTPDNSCryptor *_cryptor;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isEnterprise = NO;
        _id = nil;
        _cryptor = nil;
        _server = [NSString stringWithFormat:@"http://%@/", kHTTPDNS_DNSPOD_SERVER_ADDRESS];
    }
    return self;
}

- (instancetype)initWithAccountId:(NSString *)account andKey:(NSString *)key
{
    self = [super init];
    if (self) {
        _isEnterprise = YES;
        _id = account;
        _cryptor = [[HTTPDNSCryptor alloc] initWithKey:key];
        _server = [NSString stringWithFormat:@"http://%@/", kHTTPDNS_DNSPOD_SERVER_ADDRESS];
    }
    return self;
}

-(NSString *)getRequestString:(NSString *)domain {
    if (_isEnterprise) {
        NSString *enc = [HTTPDNSUtil encrypt:domain withCryptor:_cryptor];
        return  [NSString stringWithFormat:@"%@d?dn=%@&id=%@&ttl=1",_server, enc, _id];
    }
    return [NSString stringWithFormat:@"%@d?dn=%@&ttl=1",_server, domain];
}

-(HTTPDNSRecord *)parseResult:(NSData *)data {
    NSString *result;
    if (_isEnterprise) {
        result = [HTTPDNSUtil decrypt:data withCryptor:_cryptor];
    } else {
        result = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    }
    
    NSArray *resArray = [result componentsSeparatedByString:@","];
    if ([resArray count] < 2) {
        return nil;
    }
    
    NSString *ipStr = resArray[0];
    NSArray *ipArray = [ipStr componentsSeparatedByString:@";"];
    int ttl = [resArray[1] intValue];
    return [[HTTPDNSRecord alloc] init:ipArray ttl:ttl];
}

@end
