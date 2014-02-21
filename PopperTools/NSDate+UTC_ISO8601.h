//
//  NSDate+UTC_ISO8601.h
//  PopperTools
//
// Thanks for using PopperTools!
//
// Copyright (c) 2014 Henrique Sasaki Yuya
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

/*!
 
 @file
 NSDate+UTC_ISO8601.h
 
 @brief
 UTC and ISO8601 support for NSDate
 
 */

#import <Foundation/Foundation.h>

#pragma mark - UTC


/**
 *  UTC support
 */
@interface NSDate (UTC)


/**
*  creates and returns now UTC
*
*  @return now UTC
*/
+ (NSDate*)UTC;

/**
 *  creates and returns UTC from an NSDate instance
 *
 *  @param date local date
 *
 *  @return UTC date
 */
+ (NSDate*)UTCWithDate:(NSDate*)date;

/**
 *  convert to UTC using itsself
 *
 *  @return converted UTC
 */
- (NSDate*)convertToUTC;

@end

#pragma mark - ISO8601

/*!
 
 @brief
 ISO8601 support
 
 */
@interface NSDate (ISO8601)

/*!
 
 @brief
 returns ISO8601 format string
 
 @return
 NSString*
 ISO8601 format string
 
 */
- (NSString*)ISO8601String;

/*!
 
 @brief
 creates and returns an NSDate instance with ISO8601 format string
 
 @param
 string
 ISO8601 format string
 
 @return
 NSDate*
 created date
 
 */
+ (NSDate*)dateWithISO8601String:(NSString*)string;


@end
