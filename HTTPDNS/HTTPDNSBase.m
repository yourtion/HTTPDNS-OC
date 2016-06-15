//
//  HTTPDNSBase.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/12/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "HTTPDNSBase.h"

@implementation HTTPDNSBase

-(NSString *) getRequestString:(NSString *)domain {
    return @"";
}

-(HTTPDNSRecord *)parseResult:(NSData *)data {
    return nil;
}

- (void)requsetRecord:(NSString *)domain callback:(HTTPDNSCallback)callback {
    NSString *urlString = [self getRequestString:domain];
    NSURL *url = [NSURL URLWithString:urlString];
    
    [[[NSURLSession sharedSession] dataTaskWithURL:url completionHandler:^(NSData * _Nullable data, NSURLResponse * _Nullable response, NSError * _Nullable error) {
        HTTPDNSRecord *res = [self parseResult:data];
        callback(res);
    }] resume];
}

-(HTTPDNSRecord *)requsetRecordSync:(NSString *)domain {
    NSString *urlString = [self getRequestString:domain];
    NSURL *url = [NSURL URLWithString:urlString];
    NSData *data = [NSData dataWithContentsOfURL:url];
    HTTPDNSRecord *res = [self parseResult:data];
    return res;
}

@end
