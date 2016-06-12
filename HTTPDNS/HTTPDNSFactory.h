//
//  HTTPDNSFactory.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/12/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDNSBase.h"

@interface HTTPDNSFactory : NSObject 

+ (HTTPDNSBase *)getDNSPod;
+ (HTTPDNSBase *)getAliYun;
+ (HTTPDNSBase *)getAliYunWithKey:(NSString *)key;

@end
