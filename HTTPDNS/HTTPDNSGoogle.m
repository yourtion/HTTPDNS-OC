//
//  HTTPDNSAliYun.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/14/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSGoogle.h"

@implementation HTTPDNSGoogle 
{
    NSString *_server;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _server = [NSString stringWithFormat:@"https://%@", kHTTPDNS_GOOGLE_SERVER_ADDRESS];
    }
    return self;
}

-(NSString *)getRequestString:(NSString *)domain {
    return [NSString stringWithFormat:@"%@/resolve?type=1&name=%@", _server, domain];
}

-(HTTPDNSRecord *)parseResult:(NSData *)data {
    NSError *jsonError;
    NSDictionary *jsonDic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&jsonError];
    if (jsonError) {
        return nil;
    }
    NSArray *answerArray = [jsonDic objectForKey:@"Answer"];
    NSMutableArray *ipArray = [[NSMutableArray alloc] init];
    int ttl = 0;
    for (NSDictionary *answer in answerArray) {
        if([[answer objectForKey:@"type"] isEqual: @1]) {
            ttl = [[answer objectForKey:@"TTL"] intValue];
            [ipArray addObject:[answer objectForKey:@"data"]];
        }
    }
    if ([ipArray count] > 0 && ttl > 0) {
        return [[HTTPDNSRecord alloc] init:ipArray ttl:ttl];
    }
    return nil;
}

@end
