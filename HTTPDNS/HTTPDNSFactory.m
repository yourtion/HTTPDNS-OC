//
//  HTTPDNSFactory.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/12/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSFactory.h"
#import "HTTPDNSDNSPod.h"
#import "HTTPDNSAliYun.h"

@implementation HTTPDNSFactory

+ (HTTPDNSBase *)getDNSPod{
    return [[HTTPDNSDNSPod alloc] init];
}

+ (HTTPDNSBase *)getAliYun{
    return [[HTTPDNSAliYun alloc] init];
}

+ (HTTPDNSBase *)getAliYunWithKey:(NSString *)key{
    return [[HTTPDNSAliYun alloc] initWithAccountId:key];
}

@end
