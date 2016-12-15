//
//  ViewController.m
//  HTTPDNS-iOS-Demo
//
//  Created by YourtionGuo on 6/9/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import "ViewController.h"
#import <HTTPDNS/HTTPDNS.h>

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [[HTTPDNSClient sharedInstance] getRecord:@"www.taobao.com" callback:^(HTTPDNSRecord *record) {
        NSLog(@"IP : %@", record.ip);
        NSLog(@"description : %@", record.description);
    }];
    [[HTTPDNSClient sharedInstance] cleanAllCache];
    
    [[HTTPDNSClient sharedInstance] useDNSPod];
    [[HTTPDNSClient sharedInstance] useAliYunWithKey:@"Your Aliyun HTTPNDS accound id"];
    [[HTTPDNSClient sharedInstance] useDNSPodProWithAccount:@"Your DNSPod pro accound id" Key:@"Your DNSPod pro key"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
