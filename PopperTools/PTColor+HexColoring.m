//
//  UIColor+HexColoring.m
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

#import "PTColor+HexColoring.h"

@implementation PTColor (HexColoring)

+ (PTColor*)colorWithHex:(uint32_t)hex
{
    CGFloat red   = ((hex & 0xff000000) >> 24) / 255.0f;
    CGFloat green = ((hex & 0x00ff0000) >> 16) / 255.0f;
    CGFloat blue  = ((hex & 0x0000ff00) >> 8) / 255.0f;
    CGFloat alpha = ( hex & 0x000000ff) / 255.0f;
    
#if TARGET_OS_IPHONE == 1
    
    return [PTColor colorWithRed:red green:green blue:blue alpha:alpha];
    
#else
    
    return [PTColor colorWithDeviceRed:red green:green blue:blue alpha:alpha];
    
#endif
    
}

+ (PTColor*)colorWithHexString:(NSString*)string
{
    uint32_t hex = 0x0;
    NSScanner* scanner = [NSScanner scannerWithString:string];
    [scanner scanHexInt:&hex];
    
    return [PTColor colorWithHex:hex];
}

@end
