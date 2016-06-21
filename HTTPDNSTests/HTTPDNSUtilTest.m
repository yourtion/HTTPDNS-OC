//
//  HTTPDNSUtilTest.m
//  HTTPDNS
//
//  Created by YourtionGuo on 6/20/16.
//  Copyright © 2016 Yourtion. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "HTTPDNSHex.h"
#import "HTTPDNSUtil.h"

@interface HTTPDNSUtilTest : XCTestCase

@end

@implementation HTTPDNSUtilTest

- (void)setUp {
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testHex {
    NSString *string = @"YourtionGuo";
    NSString *en_str = [HTTPDNSHex encodeHexString:string];
    NSData *de_data = [HTTPDNSHex decodeHexString:en_str];
    NSString *en_data_str = [HTTPDNSHex encodeHexData:de_data];
    XCTAssertEqualObjects(en_str, en_data_str);
    NSString *de_str = [HTTPDNSHex decodeHexToString:en_data_str];
    XCTAssertEqualObjects(de_str, string);
}

- (void)testCryptor {
    NSString *key = @"YourtionGuo";
    NSData *string_data = [@"yourtion@gmail.com" dataUsingEncoding:kCFStringEncodingUTF8];
    HTTPDNSCryptor *cryptor = [[HTTPDNSCryptor alloc] initWithKey:key];
    XCTAssertNotNil(cryptor);
    NSData *en_data = [cryptor encrypt:string_data];
    XCTAssertNotNil(en_data);
    NSData *de_data = [cryptor decrpyt:en_data];
    XCTAssertNotNil(de_data);
    XCTAssertEqualObjects(de_data, string_data);
}

- (void)testEncryptAndDecrypt {
    NSString *key = @"yourtion";
    NSString *domain = @"blog.yourtion.com";
    NSString *en_result = [@"25243230d4554613e0d0e91e4437a611b5bc287ddbd2df4e" uppercaseString];
    HTTPDNSCryptor *cryptor = [[HTTPDNSCryptor alloc] initWithKey:key];
    XCTAssertNotNil(cryptor);
    NSString *en_str = [HTTPDNSUtil encrypt:domain withCryptor:cryptor];
    XCTAssertNotNil(en_str);
    XCTAssertEqualObjects(en_str, en_result);
    NSData *en_data = [en_str dataUsingEncoding:kCFStringEncodingUTF8];
    NSString *de_str = [HTTPDNSUtil decrypt:en_data withCryptor:cryptor];
    XCTAssertNotNil(de_str);
    XCTAssertEqualObjects(de_str, domain);
}

-(void)testNil {
    HTTPDNSCryptor *cryptor = [[HTTPDNSCryptor alloc] initWithKey:nil];
    XCTAssertNil(cryptor);
    NSString *en_str = [HTTPDNSUtil encrypt:nil withCryptor:cryptor];
    XCTAssertNil(en_str);
    NSData *en_data = [en_str dataUsingEncoding:kCFStringEncodingUTF8];
    NSString *de_str = [HTTPDNSUtil decrypt:en_data withCryptor:cryptor];
    XCTAssertNil(de_str);
    NSString *key = @"yourtion";
    cryptor = [[HTTPDNSCryptor alloc] initWithKey:key];
    XCTAssertNotNil(cryptor);
    en_str = [HTTPDNSUtil encrypt:nil withCryptor:cryptor];
    XCTAssertNil(en_str);
    en_data = [en_str dataUsingEncoding:kCFStringEncodingUTF8];
    de_str = [HTTPDNSUtil decrypt:en_data withCryptor:cryptor];
    XCTAssertNil(de_str);
}

@end
