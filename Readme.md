# HCDates

## HCDates makes dealing with fixed `NSDateFormatter`s easier and more efficient.

Rather than setting up a new date formatter every time you can just call `+[NSDateFormatter dateFormatterWithFormat:]`.
This will return a cached `NSDateFormatter` using the `en_US_POSIX` locale.

As long as the cache hasn't been cleared the call will return the same formatter every time:

    NSString *format = @"#DATE_FORMAT#";
    
    NSDateFormatter *dateFormatter1 = [NSDateFormatter dateFormatterWithFormat:format];
    NSDateFormatter *dateFormatter2 = [NSDateFormatter dateFormatterWithFormat:format];
    
    if (dateFormatter1 == dateFormatter2)
    {
        NSLog(@"The NSCache has *not* been purged");
    }
    else
    {
        NSLog(@"The NSCache has been purged, this can happen can if memory is tight");
    }
    
    [NSDateFormatter purgeDateFormatterCache];
    
    NSDateFormatter *dateFormatter3 = [NSDateFormatter dateFormatterWithFormat:format];
    
    NSAssert(dateFormatter1 != dateFormatter3, @"As the cache has been purged a new date formatter has been created");
    