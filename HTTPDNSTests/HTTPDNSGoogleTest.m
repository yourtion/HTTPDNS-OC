//
//  HTTPDNSAliYunTest.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/21/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HTTPDNSGoogle.h"

@interface HTTPDNSGoogleTest : XCTestCase

@end

@implementation HTTPDNSGoogleTest

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
    NSString *requestString = [[[HTTPDNSGoogle alloc] init] getRequestString:domain];
    XCTAssertEqualObjects(requestString, @"https://dns.google.com/resolve?type=1&name=blog.yourtion.com");
}

- (void)testParseResult {
    NSData *resultData = [@"{\"Status\":0,\"TC\":false,\"RD\":true,\"RA\":true,\"AD\":false,\"CD\":false,\"Question\":[{\"name\":\"apple.com.\",\"type\":1}],\"Answer\":[{\"name\":\"apple.com.\",\"type\":1,\"TTL\":2365,\"data\":\"17.172.224.47\"},{\"name\":\"apple.com.\",\"type\":1,\"TTL\":2365,\"data\":\"17.178.96.59\"},{\"name\":\"apple.com.\",\"type\":1,\"TTL\":2365,\"data\":\"17.142.160.59\"}]}" dataUsingEncoding:kCFStringEncodingUTF8];
    
    HTTPDNSRecord *result = [[[HTTPDNSGoogle alloc] init] parseResult:resultData];
    XCTAssertEqualObjects(result.ip, @"17.172.224.47");
    XCTAssertEqual([result.ips count], 3);
    XCTAssertEqualObjects(result.ips[0], @"17.172.224.47");
    XCTAssertEqualObjects(result.ips[1], @"17.178.96.59");
    XCTAssertEqualObjects(result.ips[2], @"17.142.160.59");
    XCTAssertLessThan(result.timeout, [[NSDate date] timeIntervalSince1970] + 2365 * 1000);
}

@end
