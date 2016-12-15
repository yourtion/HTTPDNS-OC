//
//  HTTPDNSBase.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/12/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDNSRecord.h"

const static NSString *kHTTPDNS_DNSPOD_SERVER_ADDRESS = @"119.29.29.29";
const static NSString *kHTTPDNS_ALIYUN_SERVER_ADDRESS = @"203.107.1.1";
const static NSString *kHTTPDNS_GOOGLE_SERVER_ADDRESS = @"dns.google.com";

@protocol HTTPDNSBaseProtocol

@required
- (HTTPDNSRecord *)parseResult:(NSData *)data;
- (NSString *)getRequestString:(NSString *)domain;

@end

@interface HTTPDNSBase : NSObject  <HTTPDNSBaseProtocol>

- (void)requsetRecord:(NSString *)domain callback:(HTTPDNSCallback)callback;
- (HTTPDNSRecord *)requsetRecordSync:(NSString *)domain;

@end
