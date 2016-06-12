//
//  HTTPDNSFactory.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/12/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSFactory.h"
#import "HTTPDNSDNSPod.h"

@implementation HTTPDNSFactory

+ (HTTPDNSBase *)getDNSPod{
    return [[HTTPDNSDNSPod alloc] init];
}

+ (HTTPDNSBase *)getAliYun{
    return [HTTPDNSFactory getAliYunWithKey:@"100000"];
}

+ (HTTPDNSBase *)getAliYunWithKey:(NSString *)key{
    return nil;
}

@end
