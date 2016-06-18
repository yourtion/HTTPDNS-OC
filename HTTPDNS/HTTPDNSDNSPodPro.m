//
//  HTTPDNSDNSPodPro.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/19/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSDNSPodPro.h"
#import "HTTPDNSCryptor.h"
#import "HTTPDNSUtil.h"

@implementation HTTPDNSDNSPodPro
{
    NSString *_id;
    HTTPDNSCryptor *_cryptor;
}

- (instancetype)initWithAccountId:(NSString *)account andKey:(NSString *)key
{
    self = [super init];
    if (self) {
        _id = account;
        _cryptor = [[HTTPDNSCryptor alloc] initWithKey:key];
    }
    return self;
}

-(NSString *)getRequestString:(NSString *)domain {
    NSString *enc = [HTTPDNSUtil encrypt:domain withCryptor:_cryptor];
    return  [NSString stringWithFormat:@"%@d?dn=%@&id=%@&ttl=1",kHTTPDNS_DNSPOD_SERVER_ADDRESS, enc, _id];
}

-(HTTPDNSRecord *)parseResult:(NSData *)data {
    NSString *str = [HTTPDNSUtil decrypt:data withCryptor:_cryptor];
    NSArray *strArray = [str componentsSeparatedByString:@","];
    NSString *ipStr = strArray[0];
    NSArray *ipArray = [ipStr componentsSeparatedByString:@";"];
    int ttl = [strArray[1] intValue];
    return [[HTTPDNSRecord alloc] init:ipArray ttl:ttl];
}

@end
