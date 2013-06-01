//
//  NSLocale+HCStandardLocales.m
//  components
//
//  Created by Klaus-Peter Dudas on 01/06/2013.
//  Copyright (c) 2013 Hypercrypt Solutions Ltd. All rights reserved.
//

#import "NSLocale+HCStandardLocales.h"

@implementation NSLocale (HCStandardLocales)

+ (NSLocale *)enUSPOSIXLocale
{
    static NSLocale *locale;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    });
    
    return locale;
}

@end
