# HTTPDNS

[![Carthage compatible](https://img.shields.io/badge/Carthage-compatible-4BC51D.svg?style=flat)](https://github.com/Carthage/Carthage)
[![Version](https://img.shields.io/cocoapods/v/HTTPDNS.svg?style=flat)](http://cocoapods.org/pods/HTTPDNS)
[![License](https://img.shields.io/cocoapods/l/HTTPDNS.svg?style=flat)](http://cocoapods.org/pods/HTTPDNS)
[![Platform](https://img.shields.io/cocoapods/p/HTTPDNS.svg?style=flat)](http://cocoapods.org/pods/HTTPDNS)
[![Build Status](https://travis-ci.org/yourtion/HTTPDNS-OC.svg?branch=master)](https://travis-ci.org/yourtion/HTTPDNS-OC)

HTTPDNS 库 Objdctive-C 实现。

支持 DNSPod、DNSPod 企业版、AliYunDNS、Google 等（方便扩展）

## 安装

### CocoaPod

在 `Podfile` 中添加：

```
platform :ios, '8.0'

pod 'HTTPDNS'
```

### Carthage

```
github "yourtion/HTTPDNS-OC"
```

## 使用方法

### 解析域名

```objc
#import <HTTPDNS/HTTPDNS.h>

// 解析记录
[[HTTPDNSClient sharedInstance] getRecord:@"www.taobao.com" callback:^(HTTPDNSRecord *record) {
	NSLog(@"IP : %@", record.ip);
   NSLog(@"description : %@", record.description);
}];

// 清除缓存
[[HTTPDNSClient sharedInstance] cleanAllCache];
```

### 切换 HTTPDNS 服务提供方

```objc
// 使用 DNSPod
[[HTTPDNSClient sharedInstance] useDNSPod];

// 使用 DNSPod 企业版
[[HTTPDNSClient sharedInstance] useDNSPodProWithAccount:@"Your DNSPod pro accound id" Key:@"Your DNSPod pro key"];

// 使用阿里云 HTTPDNS
[[HTTPDNSClient sharedInstance] useAliYunWithKey:@"Your Aliyun HTTPNDS accound id"];

// 使用 Google DNS-over-HTTP
[[HTTPDNSClient sharedInstance] useGoogle];
```

## TODO

- [x] 实现 DNSPod 免费版功能
- [x] 实现 DNSPod 企业版功能（认证接入）
- [x] 实现 AliYun HTTPDNS
- [x] 实现 AliYun HTTPDNS With HTTPS
- [x] 实现 Google DNS-over-HTTP
- [x] 提供清除缓存方法
- [ ] 提供自定义解析器方法
