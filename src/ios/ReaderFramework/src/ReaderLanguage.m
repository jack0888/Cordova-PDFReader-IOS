//
//	ReaderLanguage.h
//	Reader v2.7.3
//
//	Created by Emmanuel Tabard on 2014-05-27.
//	Copyright © 2011-2013 Julius Oklamcak. All rights reserved.
//
//	Permission is hereby granted, free of charge, to any person obtaining a copy
//	of this software and associated documentation files (the "Software"), to deal
//	in the Software without restriction, including without limitation the rights to
//	use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies
//	of the Software, and to permit persons to whom the Software is furnished to
//	do so, subject to the following conditions:
//
//	The above copyright notice and this permission notice shall be included in all
//	copies or substantial portions of the Software.
//
//	THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
//	OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//	FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//	AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//	WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
//	CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import "ReaderLanguage.h"

@implementation ReaderLanguage

static NSBundle *bundle = nil;

+(void)initialize {
    NSUserDefaults* defs = [NSUserDefaults standardUserDefaults];
    NSArray* languages = [defs objectForKey:@"AppleLanguages"];

    NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Reader" ofType:@"bundle"];
    bundle = [NSBundle bundleWithPath:bundlePath];
    
    for (NSString* lang in languages) {
        bundle = [NSBundle bundleWithPath:[bundle pathForResource:lang ofType:@"lproj" ]];
        if (bundle)
            break;
    }
    
    if (!bundle) {
        bundle = [NSBundle bundleWithPath:[[NSBundle bundleWithPath:bundlePath] pathForResource:@"en" ofType:@"lproj" ]];
    }
}

+(NSString *)get:(NSString *)key {
    return NSLocalizedStringFromTableInBundle(key, @"Reader", bundle ,nil);
}

@end
