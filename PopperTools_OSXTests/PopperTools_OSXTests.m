//
//  PopperTools_OSXTests.m
//  PopperTools_OSXTests
//
//  Created by Henrique Sasaki Yuya on 2/21/14.
//  Copyright (c) 2014 Henrique Sasaki Yuya. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PopperTools.h"

@interface PopperTools_OSXTests : XCTestCase

@end

@implementation PopperTools_OSXTests

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

- (void)testNSDateUTCSupport
{
    NSDate* nowUTC = [NSDate UTC];
    
    XCTAssertNil(nowUTC, @"now UTC object is nil");
    
    NSDate* date = [NSDate date];
    NSDate* utc = [NSDate UTCWithDate:date];
    
}

@end
