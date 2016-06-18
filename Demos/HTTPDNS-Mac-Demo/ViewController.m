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
    HTTPDNSBase *dns = [HTTPDNSFactory getAliYun];
    HTTPDNSRecord *res =  [dns requsetRecordSync:@"www.taobao.com"];
    NSLog(@"%@", res.description);
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

@end
