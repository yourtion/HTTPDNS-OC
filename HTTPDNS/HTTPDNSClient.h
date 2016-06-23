//
//  HTTPDNSClient.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/6/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDNSRecord.h"

@interface HTTPDNSClient : NSObject

- (void)cleanAllCache;

- (void)useDNSPod;
- (void)useAliYunWithKey:(NSString *)key;
- (void)useDNSPodProWithAccount:(NSString *)account Key:(NSString *)key;

- (void)getRecord:(NSString *)domain callback:(HTTPDNSCallback)callback;

@end
