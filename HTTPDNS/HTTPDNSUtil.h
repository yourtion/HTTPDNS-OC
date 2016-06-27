//
//  HTTPDNSUtil.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDNSCryptor.h"

@interface HTTPDNSUtil : NSObject

+ (BOOL)isHTTPEnable;

+ (NSString *)encrypt:(NSString *)domain withCryptor:(HTTPDNSCryptor *)cryptor;
+ (NSString *)decrypt:(NSData *)raw withCryptor:(HTTPDNSCryptor *)cryptor;

@end
