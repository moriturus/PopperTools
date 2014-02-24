//
//  PTDefines.h
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
 PTDefines.h
 
 @brief
 defines some macros
 
 */

#ifndef PopperTools_PTDefines_43691923_EF78_4B48_ADC0_EE4B589BE9FB
#define PopperTools_PTDefines_43691923_EF78_4B48_ADC0_EE4B589BE9FB

#ifndef PT_DEBUG_MACROS

#ifdef DEBUG

/*!
 
 @brief
 NSLog wrapper
 
 @param
 ...
 arguments same as NSLog()
 
 */
#define PTLOG(...) NSLog(__VA_ARGS__)

/*!
 
 @brief
 prints line number
 
 */
#define PTLINE() NSLog(@"%d",__LINE__)

/*!
 
 @brief
 prints function/method name
 
 */
#define PTFUNC() NSLog(@"%s",__PRETTY_FUNCTION__)

/*!
 
 @brief
 prints function/method and line number
 
 */
#define PTFUNCLINE() NSLog(@"%s - %d",__PRETTY_FUNCTION__,__LINE__)

#else

/*!
 
 @brief
 NSLog wrapper
 
 @param
 ...
 arguments same as NSLog()
 
 */
#define PTLOG(...) ;

/*!
 
 @brief
 prints line number
 
 */
#define PTLINE() ;

/*!
 
 @brief
 prints function/method name
 
 */
#define PTFUNC() ;

/*!
 
 @brief
 prints function/method and line number
 
 */
#define PTFUNCLINE() ;

#endif

#endif

/*!

 @brief
 replaces "true" if the paramator is true(not 0, not NULL, not nil) otherwise replaces "false"
 
 @param
 __BOOL
 some value
 
 */
#define BOOLSTR(__BOOL) ((__BOOL) ? "true" : "false")

/*!

 @brief
 replaces \@"YES" if the paramator is true(not 0, not NULL, not nil) otherwise replaces \@"NO"
 
 @param
 __BOOL 
 some value
 
 */
#define objcBoolString(__BOOL) ((__BOOL) ? @"YES" : @"NO")

/*!
 
 @brief
 replaces '\\n', '\\t', '\\"' in -description method
 
 @param
 __INSTANCE
 some instance
 
 */
#define prettyDescription(__INSTANCE) [[[[__INSTANCE description] \
stringByReplacingOccurrencesOfString:@"\\n" withString:@"\n"] \
stringByReplacingOccurrencesOfString:@"\\t" withString:@"\t"] \
stringByReplacingOccurrencesOfString:@"\\\"" withString:@"\""]


/*!
 
 @brief
 replaces pre-blocks variable declaration
 
 @param
 __CLASS
 some object type
 
 */
#define PTBLOCK(__CLASS) __block __CLASS __weak

/*!
 
 @brief
 replaces weak self declaration
 
 */
#define PTWEAKSELF __block typeof(self) __weak

#endif

