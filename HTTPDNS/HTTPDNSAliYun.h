//
//  HTTPDNSAliYun.h
//  HTTPDNS
//
//  Created by YourtionGuo on 6/14/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "HTTPDNSBase.h"

@interface HTTPDNSAliYun : HTTPDNSBase<HTTPDNSBaseProtocol>

- (instancetype)initWithAccountId:(NSString *)account;

- (void)disableHTTPS;

@end
