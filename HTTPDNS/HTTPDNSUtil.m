//
//  HTTPDNSUtil.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSUtil.h"

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

@end
