//
//  HTTPDNSDNSPod.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/12/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDNSBase.h"

@interface HTTPDNSDNSPod : HTTPDNSBase<HTTPDNSBaseProtocol>

- (instancetype)initWithAccountId:(NSString *)account andKey:(NSString *)key;

@end
