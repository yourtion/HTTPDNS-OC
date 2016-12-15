//
//  HTTPDNSAliYunTest.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/21/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HTTPDNSAliYun.h"

@interface HTTPDNSAliYunTest : XCTestCase

@end

@implementation HTTPDNSAliYunTest

static NSString *domain = @"blog.yourtion.com";
static NSString *account = @"GYX";

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testGetRequestString {
    NSString *requestString = [[[HTTPDNSAliYun alloc] initWithAccountId:account] getRequestString:domain];
    XCTAssertEqualObjects(requestString, @"https://203.107.1.1/GYX/d?host=blog.yourtion.com");
}

- (void)testGetRequestStringWithoutHTTPS {
    HTTPDNSAliYun *dns = [[HTTPDNSAliYun alloc] initWithAccountId:account];
    [dns disableHTTPS];
    NSString *requestString = [dns getRequestString:domain];
    XCTAssertEqualObjects(requestString, @"http://203.107.1.1/GYX/d?host=blog.yourtion.com");
}

- (void)testParseResult {
    NSData *resultData = [@"{\"host\":\"yourtion.com\",\"ips\":[\"192.243.118.110\",\"192.243.118.111\",\"192.243.118.112\"],\"ttl\":600}" dataUsingEncoding:kCFStringEncodingUTF8];
    
    HTTPDNSRecord *result = [[[HTTPDNSAliYun alloc] initWithAccountId:account] parseResult:resultData];
    XCTAssertEqualObjects(result.ip, @"192.243.118.110");
    XCTAssertEqual([result.ips count], 3);
    XCTAssertEqualObjects(result.ips[0], @"192.243.118.110");
    XCTAssertEqualObjects(result.ips[1], @"192.243.118.111");
    XCTAssertEqualObjects(result.ips[2], @"192.243.118.112");
    XCTAssertLessThan(result.timeout, [[NSDate date] timeIntervalSince1970] + 601 * 1000);
}

@end
