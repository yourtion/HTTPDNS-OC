//
//  HTTPDNSAliYun.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/14/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSAliYun.h"

@implementation HTTPDNSAliYun
{
    NSString *_accountId;
    NSString *_server;
}

- (instancetype)initWithAccountId:(NSString *)account
{
    self = [super init];
    if (self) {
        _accountId = account;
        _server = [NSString stringWithFormat:@"https://%@/", kHTTPDNS_ALIYUN_SERVER_ADDRESS];
    }
    return self;
}

-(void)disableHTTPS {
    _server = [NSString stringWithFormat:@"http://%@/", kHTTPDNS_ALIYUN_SERVER_ADDRESS];
}

-(NSString *)getRequestString:(NSString *)domain {
    return [NSString stringWithFormat:@"%@%@/d?host=%@", _server, _accountId, domain];
}

-(HTTPDNSRecord *)parseResult:(NSData *)data {
    NSError *jsonError;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (jsonError) {
        return nil;
    }
    NSArray *ipArray = [jsonDic objectForKey:@"ips"];
    int ttl = [[jsonDic objectForKey:@"ttl"] intValue];
    if (ipArray && ttl) {
        return [[HTTPDNSRecord alloc] init:ipArray ttl:ttl];
    }
    return nil;
}

@end
