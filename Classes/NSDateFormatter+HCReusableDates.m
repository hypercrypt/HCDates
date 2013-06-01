//
//  NSDateFormatter+HCReusableDates.m
//  components
//
//  Created by Klaus-Peter Dudas on 31/05/2013.
//  Copyright (c) 2013 Hypercrypt Solutions Ltd. All rights reserved.
//

#import "NSDateFormatter+HCReusableDates.h"

const NSTimeInterval HCTimeIntervalMinute = 60.0f;
const NSTimeInterval HCTimeIntervalHour   = 60.0f * HCTimeIntervalMinute;
const NSTimeInterval HCTimeIntervalDay    = 24.0f * HCTimeIntervalHour;
const NSTimeInterval HCTimeIntervalWeek   =  7.0f * HCTimeIntervalDay;

@implementation NSDateFormatter (HCReusableDates)

static NSCache *cache;

+ (void)purgeDateFormatterCache
{
    [cache removeAllObjects];
}

+ (NSDateFormatter *)dateFormatterWithFormat:(NSString *)format
{
    NSParameterAssert(format.length);
    
    static NSLocale *locale;
    
    static dispatch_once_t cacheOnceToken;
    dispatch_once(&cacheOnceToken, ^{
        cache  = [[NSCache alloc] init];
        locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US_POSIX"];
    });
    
    NSDateFormatter *dateFormatter = [cache objectForKey:format];
    
    if (!dateFormatter)
    {
        NSString *formatString = [format copy];
        
        dateFormatter = [[NSDateFormatter alloc] init];
        dateFormatter.locale = locale;
        dateFormatter.dateFormat = formatString;
        
        [cache setObject:dateFormatter forKey:formatString];
    }
    
    return dateFormatter;
}

@end
