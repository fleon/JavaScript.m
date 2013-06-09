//
//  NSString+JSString.m
//  Spellbound
//
//  Created by Fleon Games on 6/9/13.
//
//

#import "JavaScript.h"

@implementation NSString (JavaScript)

-(NSString *(^)(NSInteger index))charAt
{
    return [^NSString *(NSInteger index) {
        if (index >= self.length || index < 0) return @"";
        unichar charAtIndex = [self characterAtIndex:index];
        return [NSString stringWithCharacters:&charAtIndex length:1];
    } autorelease];
}

-(NSInteger(^)(NSInteger index))charCodeAt
{
    return [^NSInteger(NSInteger index) {
        NSString *str = [self copy];
        if (index >= str.length || index < 0) return NaN;
        NSInteger retval = [str characterAtIndex:index];
        [str release];
        return retval;
    } autorelease];
}

-(NSString *(^)(NSString *string, ...))concat
{
    return [^NSString *(NSString *string, ...) {
        NSString *retval = self;
        va_list args;
        va_start(args, string);
        for (NSString *arg = string; arg != nil; arg = va_arg(args, NSString*))
            retval = [retval stringByAppendingString:arg];
        va_end(args);
        return retval;
    } autorelease];
}

-(BOOL(^)(NSString *string))equals
{
    return [^BOOL(NSString *string) {
        return [self isEqualToString:string];
    } autorelease];
}

-(NSInteger(^)(NSString *string, /*NSInteger index*/...))indexOf
{
    return [^NSInteger(NSString *string, ...) {
        va_list args;
        va_start(args, string);
        NSInteger index = va_arg(args, NSInteger);
        if (index < 0) index = -index;
        if (index == NaN) index = 0;
        va_end(args);
        if ([string isEqualToString:@""]) return index;
        NSInteger retval = [self rangeOfString:string
                                        options:0
                                          range:NSMakeRange(index, self.length - index)].location;
        return retval == NSNotFound ? -1 : retval;
    } autorelease];
}

-(NSInteger(^)(NSString *string, /*NSInteger index*/...))lastIndexOf
{
    return [^NSInteger(NSString *string, ...) {
        va_list args;
        va_start(args, string);
        NSInteger index = va_arg(args, NSInteger);
        if (index == NaN) index = self.length;
        va_end(args);
        if ([string isEqualToString:@""]) return index;
        NSInteger retval = [self rangeOfString:string
                                        options:NSBackwardsSearch
                                          range:NSMakeRange(0, index)].location;
        return retval == NSNotFound ? -1 : retval;
    } autorelease];
}

-(NSString *(^)(id regexpOrString, id stringOrBlock))replace
{
    
}

-(NSInteger(^)(NSRegularExpression *regexp))search
{
    
}

-(NSString *(^)(NSInteger begin, /*NSInteger end*/...))slice
{
    return [^NSString *(NSInteger begin, ...) {
        va_list args;
        va_start(args, begin);
        NSInteger end = va_arg(args, NSInteger);
        va_end(args);
        if (end == NaN)
            end = self.length;
        
        if (begin < 0)
            begin += self.length;
        if (end < 0)
            end += self.length;
        if (begin >= end) return @"";
        // fix this
        
        
        
        return [self substringWithRange:NSMakeRange(begin, end - begin)];
    } autorelease];
}

-(NSArray *(^)(id regexpOrString, /*NSInteger count*/...))split
{
    return [^NSArray *(id regexpOrString, ...) {
        va_list args;
        va_start(args, regexpOrString);
        NSInteger count = va_arg(args, NSInteger);
        va_end(args);
        
        NSMutableArray *retval;
        if ([regexpOrString isKindOfClass:[NSString class]])
            retval = [[[self componentsSeparatedByString:regexpOrString] mutableCopy] autorelease];
        else {
            // fill in later
            retval = [NSMutableArray array];
        }
        
        if (count == NaN) count = retval.count;
        [retval removeObjectsAtIndexes:
         [NSIndexSet indexSetWithIndexesInRange:NSMakeRange(count, retval.count - count)]];
        
        return [NSArray arrayWithArray:retval];
    } autorelease];
}

-(NSString *(^)(NSInteger begin, /*NSInteger length*/...))substr
{
    return [^NSString *(NSInteger begin, ...) {
        va_list args;
        va_start(args, begin);
        NSInteger length = va_arg(args, NSInteger);
        va_end(args);
        
        if (begin < 0) {
            begin += self.length;
            if (begin > self.length) begin = 0;
        }
        if (length == NaN) length = self.length - begin;
        if (begin >= self.length) return @"";
        
        return [self substringWithRange:NSMakeRange(begin, length)];
    } autorelease];
}

-(NSString *(^)(NSInteger begin, /*NSInteger end*/...))substring
{
    return [^NSString *(NSInteger begin, ...) {
        va_list args;
        va_start(args, begin);
        NSInteger end = va_arg(args, NSInteger);
        if (end == NaN) end = self.length;
        if (begin < 0) begin = 0;
        if (end < 0) end = 0;
        if (begin > self.length) begin = self.length;
        if (end > self.length) end = self.length;
        if (begin > end) {
            NSInteger temp = begin;
            begin = end;
            end = temp;
        }
        va_end(args);
        
        return [self substringWithRange:NSMakeRange(begin, end - begin)];
    } autorelease];
}

-(NSString *(^)(void))toLowerCase
{
    return [^NSString *(void) {
        return [self lowercaseString];
    } autorelease];
}

-(NSString *(^)(void))toUpperCase
{
    return [^NSString *(void) {
        return [self uppercaseString];
    } autorelease];
}

-(NSString *(^)(void))trim
{
    return [^NSString *(void) {
        return [self stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
    } autorelease];
}

-(NSString *(^)(void))trimLeft
{
    return [^NSString *(void) {
        NSInteger i;
        NSString *str = [self copy];
        NSCharacterSet *characterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        for (i = 0; i < [str length]; i++)
            if (![characterSet characterIsMember:[str characterAtIndex:i]]) break;
        NSString *retval = [str substringFromIndex: i];
        [str release];
        return retval;
    } autorelease];
}

-(NSString *(^)(void))trimRight
{
    return [^NSString *(void) {
        NSInteger i;
        NSString *str = [self copy];
        NSCharacterSet *characterSet = [NSCharacterSet whitespaceAndNewlineCharacterSet];
        for(i = [str length] - 1; i >= 0; i--)
            if (![characterSet characterIsMember:[str characterAtIndex:i]]) break;
        NSString *retval = [str substringToIndex: i + 1];
        [str release];
        return retval;
    } autorelease];
}

@end
