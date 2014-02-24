# PopperTools


A tiny library that makes your programming little happy :-)

## CI Status


| branch | status |
|:-:|:-:|
| master | [![Build Status](https://travis-ci.org/moriturus/PopperTools.png?branch=master)](https://travis-ci.org/moriturus/PopperTools) |
| develop | [![Build Status](https://travis-ci.org/moriturus/PopperTools.png?branch=develop)](https://travis-ci.org/moriturus/PopperTools) |

## Usage


### NSDate

- Convert `NSDate` into ISO 8601 formatted string

```
NSTimeZone* timeZone = [NSTimeZone systemTimeZone];
NSString* dateString = [[NSDate date] ISO8601StringWithTimeZone:timeZone];
```

### NSDictionary

- Get `NSDictionary` sorted keys enumerator

```
NSEnumerator* enumerator = [dictionary sortedKeyWithSortOption:PTSortOptionAscending];
```

### NSMutableArray

- Randomize `NSMutableArray`

```
[mutableArray randomize];
```

### NSObject

- Method Swizzling shortcut

```
[MyClass swizzleClassMethodFrom:originalSelector to:newSelector];
[MyClass swizzleInstanceMethodFrom:originalSelector to:newSelector];
```

- Check whether or not the object is `NSNull`

```
BOOL isNSNull = [object isNSNull];
```

- Get reference count value on ARC environment

```
CFIndex count = [object referenceCount];
```

### NSURL

- Get popular directories paths as `NSURL`

```
NSURL* libraryURL = [NSURL appLibraryDirectoryURL];

NSURL* cachesURL = [NSURL appLibraryCacheDirectoryURL];

NSURL* documentsURL [NSURL userDocumentsDirectoryURL];
```

### NSColor/UIColor

- Get `NSColor` / `UIColor` with the RGBA hexadecimal color format

```
// "PTColor" will be replaced NSColor on OSX, UIColor on iOS 
PTColor* color = [PTColor colorWithHex:0xffa500ff];

PTColor* color = [PTColor colorWithHexString:@"c0c0c0ff"];
```

### Preprocessor Macros

- Logging macros removing automatically at release build

```
PTLOG(@"error: %@",error);
```

- Syntax sugars for blocks expressions

```
PTBLOCK(NSObject*) weakObject = object;

PTWEAKSELF weakSelf = self;
```

## License


PopperTools is licensed under The MIT License.

Copyright (c) 2014 Henrique Sasaki Yuya

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
