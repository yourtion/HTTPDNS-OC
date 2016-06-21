//
//  HTTPDNSUtil.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSUtil.h"
#import "HTTPDNSHex.h"
#import "HTTPDNSCryptor.h"

#if TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#endif

@implementation HTTPDNSUtil

+ (BOOL)needTransportSecurity {
#if TARGET_OS_IPHONE
    if([[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending){
        return YES;
    }
#elif TARGET_OS_MAC
    NSDictionary *systemVersionDictionary = [NSDictionary dictionaryWithContentsOfFile:@"/System/Library/CoreServices/SystemVersion.plist"];
    if([[systemVersionDictionary objectForKey:@"ProductVersion"] compare:@"10.11" options:NSNumericSearch] != NSOrderedAscending){
        return YES;
    }
#endif
    return NO;
}

+ (BOOL)isHTTPEnable {
    if([HTTPDNSUtil needTransportSecurity]){
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        return [[[infoDict objectForKey:@"NSAppTransportSecurity"] objectForKey:@"NSAllowsArbitraryLoads"] boolValue];
    }
    return YES;
}

+ (int)getSecondTimestamp {
    return (int)[[NSDate date] timeIntervalSince1970] * 1000;
}

+ (NSString *)encrypt:(NSString *)domain withCryptor:(HTTPDNSCryptor *)cryptor {
    if (!domain || !cryptor) return nil;
    NSData *data = [cryptor encrypt:[domain dataUsingEncoding:NSUTF8StringEncoding]];
    if (data == nil) {
        return nil;
    }
    NSString *str = [HTTPDNSHex encodeHexData:data];
    return str;
}

+ (NSString *)decrypt:(NSData *)raw withCryptor:(HTTPDNSCryptor *)cryptor {
    if (!raw || !cryptor) return nil;
    NSData *enc = [HTTPDNSHex decodeHexString:[[NSString alloc] initWithData:raw
                                                               encoding:NSUTF8StringEncoding]];
    if (enc == nil) {
        return nil;
    }
    NSData *data = [cryptor decrpyt:enc];
    if (data == nil) {
        return nil;
    }
    return [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
}

@end
