//
//  PopperToolsTests.m
//  PopperToolsTests
//
//  Created by Henrique Sasaki Yuya on 2/21/14.
//  Copyright (c) 2014 Henrique Sasaki Yuya. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PopperTools.h"

@interface PopperToolsTests : XCTestCase

@end

@implementation PopperToolsTests

- (void)setUp
{
    [super setUp];
    // Put setup code here. This method is called before the invocation of each test method in the class.
}

- (void)tearDown
{
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testNSDate_ISO8601StringWithTimeZone_JST
{
    NSString* testString = @"1970-01-01T09:00:00+0900";
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:0.0];
    NSString* dateString = [date ISO8601StringWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"JST"]];
    
    XCTAssertTrue([testString isEqualToString:dateString], @"%s failed",__PRETTY_FUNCTION__);
}

- (void)testNSDate_ISO8601StringWithTimeZone_UTC
{
    NSString* testString = @"1970-01-01T00:00:00+0000";
    NSDate* date = [NSDate dateWithTimeIntervalSince1970:0.0];
    NSString* dateString = [date ISO8601StringWithTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"UTC"]];
    
    XCTAssertTrue([testString isEqualToString:dateString], @"%s failed",__PRETTY_FUNCTION__);
}

- (void)testNSDate_dateWithISO8601String
{
    NSString* testString = @"1970-01-01T00:00:00+0000";
    NSDate* date = [NSDate dateWithISO8601String:testString];
    
    XCTAssertEqual(0.0, [date timeIntervalSince1970], @"%s failed",__PRETTY_FUNCTION__);
}

@end
