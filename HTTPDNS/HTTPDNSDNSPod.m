//
//  HTTPDNSDNSPod.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/12/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSDNSPod.h"

@implementation HTTPDNSDNSPod

-(NSString *)getRequestString:(NSString *)domain {
    return [NSString stringWithFormat:@"%@d?dn=%@&ttl=1",kHTTPDNS_DNSPOD_SERVER_ADDRESS, domain];
}

-(HTTPDNSRecord *)parseResult:(NSData *)data {
    NSString *str = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSArray *strArray = [str componentsSeparatedByString:@","];
    NSString *ipStr = strArray[0];
    NSArray *ipArray = [ipStr componentsSeparatedByString:@";"];
    int ttl = [strArray[1] intValue];
    return [[HTTPDNSRecord alloc] init:ipArray ttl:ttl];
}

@end
