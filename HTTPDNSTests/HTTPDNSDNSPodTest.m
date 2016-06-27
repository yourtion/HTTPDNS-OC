//
//  HTTPDNSDNSPodTest.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/21/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HTTPDNSDNSPod.h"

@interface HTTPDNSDNSPodTest : XCTestCase

@end

@implementation HTTPDNSDNSPodTest

static NSString *domain = @"blog.yourtion.com";
static NSString *account = @"GYX";
static NSString *key = @"yourtion";

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetRequestString {
    NSString *requestString = [[[HTTPDNSDNSPod alloc] init] getRequestString:domain];
    XCTAssertEqualObjects(requestString, @"http://119.29.29.29/d?dn=blog.yourtion.com&ttl=1");
}

- (void)testGetRequestStringPro {
    NSString *requestStringPro = [[[HTTPDNSDNSPod alloc] initWithAccountId:account andKey:key] getRequestString:domain];
    XCTAssertEqualObjects(requestStringPro, @"http://119.29.29.29/d?dn=25243230D4554613E0D0E91E4437A611B5BC287DDBD2DF4E&id=GYX&ttl=1");
}

- (void)testParseResult {
    NSData *resultData = [@"192.243.118.110;192.243.118.111;192.243.118.112,600" dataUsingEncoding:kCFStringEncodingUTF8];
    
    HTTPDNSRecord *result = [[[HTTPDNSDNSPod alloc] init] parseResult:resultData];
    XCTAssertEqualObjects(result.ip, @"192.243.118.110");
    XCTAssertEqual([result.ips count], 3);
    XCTAssertEqualObjects(result.ips[0], @"192.243.118.110");
    XCTAssertEqualObjects(result.ips[1], @"192.243.118.111");
    XCTAssertEqualObjects(result.ips[2], @"192.243.118.112");
    XCTAssertLessThan(result.timeout, [[NSDate date] timeIntervalSince1970] + 601 * 1000);
}

- (void)testParseResultPro {
    NSData *encResultData = [@"17741E1445969076C83EDB701E15A32F17741E14459690769A33F3B9E2E8F4A617741E144596907647F0E551E5B6E1AA8B88FEC2CF35449E" dataUsingEncoding:kCFStringEncodingUTF8];
    
    HTTPDNSRecord *result = [[[HTTPDNSDNSPod alloc] initWithAccountId:account andKey:key] parseResult:encResultData];
    XCTAssertEqualObjects(result.ip, @"192.243.118.110");
    XCTAssertEqual([result.ips count], 3);
    XCTAssertEqualObjects(result.ips[0], @"192.243.118.110");
    XCTAssertEqualObjects(result.ips[1], @"192.243.118.111");
    XCTAssertEqualObjects(result.ips[2], @"192.243.118.112");
    XCTAssertLessThan(result.timeout, [[NSDate date] timeIntervalSince1970] + 601 * 1000);
}

@end
