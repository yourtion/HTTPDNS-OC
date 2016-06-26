//
//  ViewController.m
//  HTTPDNS-Mac-Demo
//
//  Created by YourtionGuo on 6/9/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "ViewController.h"
#import <HTTPDNS/HTTPDNS.h>

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Do any additional setup after loading the view.
    HTTPDNSClient *dns = [[HTTPDNSClient alloc] init];
    [dns getRecord:@"www.taobao.com" callback:^(HTTPDNSRecord *record) {
        NSLog(@"IP : %@", record.ip);
        NSLog(@"description : %@", record.description);
    }];
    [dns cleanAllCache];
    
    [dns useDNSPod];
    [dns useAliYunWithKey:@"Your Aliyun HTTPNDS accound id"];
    [dns useDNSPodProWithAccount:@"Your DNSPod pro accound id" Key:@"Your DNSPod pro key"]
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
