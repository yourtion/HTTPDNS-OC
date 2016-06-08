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

+ (BOOL)isHTTPEnable {
    #if TARGET_OS_IPHONE
    if([[[UIDevice currentDevice] systemVersion] compare:@"9.0" options:NSNumericSearch] != NSOrderedAscending){
        NSDictionary *infoDict = [[NSBundle mainBundle] infoDictionary];
        return [[[infoDict objectForKey:@"NSAppTransportSecurity"] objectForKey:@"NSAllowsArbitraryLoads"] boolValue];
    }
    #endif
    return YES;
}

+ (int)getSecondTimestamp {
    return (int)[[NSDate date] timeIntervalSince1970] * 1000;
}

@end
