//
//  HTTPDNSBase.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/12/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDNSRecord.h"

typedef enum : NSUInteger {
    HTTPDNSProviderDNSPod,
    HTTPDNSProviderDNSPodPro,
    HTTPDNSProviderAliYun,
} HTTPDNSProvider;

const static NSString *kHTTPDNS_DNSPOD_SERVER_ADDRESS = @"http://119.29.29.29/";

@protocol HTTPDNSBaseProtocol

@required
- (HTTPDNSRecord *)parseResult:(NSData *)data;
- (NSString *)getRequestString:(NSString *)domain;

@end

@interface HTTPDNSBase : NSObject  <HTTPDNSBaseProtocol>

- (void)requsetRecord:(NSString *)domain callback:(void (HTTPDNSRecord *record))callback;
- (HTTPDNSRecord *)requsetRecordSync:(NSString *)domain;

@end
