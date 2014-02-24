//
//  PopperTools_OSXTests.m
//  PopperTools_OSXTests
//
//  Created by Henrique Sasaki Yuya on 2/21/14.
//  Copyright (c) 2014 Henrique Sasaki Yuya. All rights reserved.
//

#import <XCTest/XCTest.h>
#import "PopperTools.h"

@interface PTSwizzleClass : NSObject

@end

@implementation PTSwizzleClass

- (instancetype)init
{
    self = [super init];
    
    if (self) {
        
        [[self class] swizzleInstanceMethodFrom:@selector(description) to:@selector(sayHello)];
        
    }
    
    return self;
}

+ (NSString*)originalClassMethod
{
    return @"bonjour";
}

- (NSString*)sayHello
{
    return @"hello";
}

@end

@interface PTSwizzleSubClass : PTSwizzleClass

@end

@implementation PTSwizzleSubClass

+ (void)swizzle
{
    [[self class] swizzleClassMethodFrom:@selector(originalClassMethod) to:@selector(swizzleClassMethod)];
}

+ (NSString*)swizzleClassMethod
{
    return @"buongiorno";
}

@end

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

- (void)testNSDictionary_sortedKeyEnumeratorWithSortOption_ascending
{
    NSDictionary* dictionary = @{
                                 @"b":@"0",
                                 @"a":@"1"
                                 };
    
    NSEnumerator* enumerator = [dictionary sortedKeysEnumeratorWithSortOption:PTSortOptionAscending];
    NSArray* keys = [enumerator allObjects];
    
    XCTAssertEqual(@"a", keys[0], @"keys[0] => %@",keys[0]);
}

- (void)testNSDictionary_sortedKeyEnumeratorWithSortOption_descending
{
    NSDictionary* dictionary = @{
                                 @"a":@"0",
                                 @"b":@"1"
                                 };
    
    NSEnumerator* enumerator = [dictionary sortedKeysEnumeratorWithSortOption:PTSortOptionDescending];
    NSArray* keys = [enumerator allObjects];
    
    XCTAssertEqual(@"b", keys[0], @"keys[0] => %@",keys[0]);
}

- (void)testNSMutableArray_randomize
{
    NSArray* originalArray = @[@0,@1,@2,@3,@4];
    NSMutableArray* array = [NSMutableArray arrayWithArray:originalArray];
    [array randomize];
    
    XCTAssertFalse([array isEqualToArray:originalArray], @"%s failed",__PRETTY_FUNCTION__);
}

- (void)testNSMutableArray_randomizeWithCount_5
{
    NSArray* originalArray = @[@0,@1,@2,@3,@4,@5,@6,@7,@8,@9];
    NSMutableArray* array = [NSMutableArray arrayWithArray:originalArray];
    [array randomizeWithCount:5];
    
    XCTAssertFalse([array isEqualToArray:originalArray], @"%s failed",__PRETTY_FUNCTION__);
}

- (void)testNSMutableArray_randomizeWithCount_6
{
    NSArray* originalArray = @[@0,@1,@2,@3,@4];
    NSMutableArray* array = [NSMutableArray arrayWithArray:originalArray];
    
    XCTAssertThrows([array randomizeWithCount:6], @"%s failed",__PRETTY_FUNCTION__);
}

- (void)testNSObject_swizzleClassMethodFrom_to
{
    NSString* italien = @"buongiorno";
    [PTSwizzleSubClass swizzle];
    
    XCTAssertEqual(italien, [PTSwizzleSubClass originalClassMethod], @"%@ != %@",italien,[PTSwizzleSubClass originalClassMethod]);
}

- (void)testNSObject_swizzleInstanceMethodFrom_to
{
    NSString* testString = @"hello";
    PTSwizzleClass* testClass = [[PTSwizzleClass alloc] init];
    
    XCTAssertEqual(testString, [testClass description], @"%@ != %@",testString,[testClass description]);
}

- (void)testNSObject_isNSNull_true
{
    id object = [NSNull null];
    
    XCTAssertTrue([object isNSNull], @"object is not NSNull");
}

- (void)testNSObject_isNSNull_false
{
    id object = [[NSObject alloc] init];
    
    XCTAssertFalse([object isNSNull], @"object is NSNull");
}

- (void)testNSObject_referenceCount_1
{
    id object = [[NSObject alloc] init];
    
    XCTAssertEqual(1l, [object referenceCount], @"reference count is %ld",[object referenceCount]);
}

- (void)testNSObject_referenceCount_2
{
    id object = [[NSObject alloc] init];
    NSArray* array = @[object];
    
    XCTAssertEqual(2l, [object referenceCount], @"reference count is %ld",[object referenceCount]);
    XCTAssertEqual(1l, [array referenceCount], @"reference count is %ld",[array referenceCount]);
}

- (void)testNSURL_appLibraryDirectoryURL
{
    NSString* testString = @"Library";
    NSURL* url = [NSURL appLibraryDirectoryURL];
    
    XCTAssertTrue([testString isEqualToString:[url lastPathComponent]], @"last path component is not Library, %@",[url lastPathComponent]);
}

- (void)testNSURL_appLibraryCacheDirectoryURL
{
    NSString* testString = @"Caches";
    NSURL* url = [NSURL appLibraryCacheDirectoryURL];
    
    XCTAssertTrue([testString isEqualToString:[url lastPathComponent]], @"last path component is not Caches, %@",[url lastPathComponent]);
}

- (void)testNSURL_userDocumentsDirectoryURL
{
    NSString* testString = @"Documents";
    NSURL* url = [NSURL userDocumentsDirectoryURL];
    
    XCTAssertTrue([testString isEqualToString:[url lastPathComponent]], @"last path component is not Documents, %@",[url lastPathComponent]);
}

- (void)testNSURL_downloadDirectoryURL
{
    NSString* testString = @"download";
    NSURL* url = [NSURL downloadDirectoryURL];
    
    XCTAssertTrue([testString isEqualToString:[url lastPathComponent]], @"last path component is not download, %@",[url lastPathComponent]);
}

@end
