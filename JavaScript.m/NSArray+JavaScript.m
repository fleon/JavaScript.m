//
//  NSArray+JavaScript.m
//  Spellbound
//
//  Created by Fleon Games on 6/9/13.
//
//

#import "JavaScript.h"

@implementation NSArray (JavaScript)

-(NSArray *(^)(id itemOrArray, ...))concat
{
    return [^NSArray *(id itemOrArray, ...) {
        NSMutableArray *retval = [self.mutableCopy autorelease];
        va_list args;
        va_start(args, itemOrArray);
        for (id arg = itemOrArray; arg != nil; arg = va_arg(args, id))
        {
            if ([arg isKindOfClass:[NSArray class]])
                [retval addObjectsFromArray:arg];
            else
                [retval addObject:arg];
        }
        va_end(args);
        return [NSArray arrayWithArray:retval];
    } autorelease];
}

-(BOOL(^)(NSArray *array))equals
{
    return [^BOOL (NSArray *array) {
        return [self isEqualToArray:array];
    } autorelease];
}

-(NSInteger(^)(id item, /*NSInteger index*/...))indexOf
{
    return [^NSInteger(id item, ...) {
        va_list args;
        va_start(args, item);
        NSUInteger index = va_arg(args, NSInteger);
        if (index == NaN) index = 0;
        va_end(args);
        return [self indexOfObject:item inRange:NSMakeRange(index, self.count - index)];
    } autorelease];
}

-(NSInteger(^)(id item, /*NSInteger index*/...))lastIndexOf
{
    return [^NSInteger(id item, ...) {
        va_list args;
        va_start(args, item);
        NSUInteger index = va_arg(args, NSInteger);
        if (index == NaN) index = self.count;
        va_end(args);
        // this is incorrect (no idea how to fix this)
        return [self indexOfObjectWithOptions:NSEnumerationReverse passingTest:^BOOL(id obj, NSUInteger idx, BOOL *stop) {
            if (idx < index) *stop = YES;
            return [obj isEqual:item];
        }];
    } autorelease];
}

-(NSString *(^)(NSString *separator))join
{
    return [^NSString *(NSString *separator) {
        return [self componentsJoinedByString:separator];
    } autorelease];
}

-(NSArray *(^)(NSInteger begin, NSInteger end))slice
{
    // implement this
}

//---------------//

-(void(^)(void(^callback)(id element, NSInteger index, NSArray *array)))forEach
{
    return [^void (void(^callback)(id element, NSInteger index, NSArray *array)) {
        for (NSInteger i = 0, il = self.count; i < il; i++)
            callback(self[i], i, self);
    } autorelease];
}

-(BOOL(^)(BOOL(^callback)(id element, NSInteger index, NSArray *array)))every
{
    return [^BOOL (BOOL(^callback)(id element, NSInteger index, NSArray *array)) {
        for (NSInteger i = 0, il = self.count; i < il; i++)
            if (!callback(self[i], i, self))
                return NO;
        return YES;
    } autorelease];
}

-(BOOL(^)(BOOL(^callback)(id element, NSInteger index, NSArray *array)))some
{
    return [^BOOL (BOOL(^callback)(id element, NSInteger index, NSArray *array)) {
        for (NSInteger i = 0, il = self.count; i < il; i++)
            if (callback(self[i], i, self))
                return YES;
        return NO;
    } autorelease];
}

-(NSArray *(^)(BOOL(^callback)(id element, NSInteger index, NSArray *array)))filter
{
    return [^NSArray *(BOOL(^callback)(id element, NSInteger index, NSArray *array)) {
        NSMutableArray *retval = [NSMutableArray array];
        for (NSInteger i = 0, il = self.count; i < il; i++) {
            id val = self[i];
            if (callback(val, i, self))
                [retval addObject:val];
        }
        return [NSArray arrayWithArray:retval];
    } autorelease];
}

-(NSArray *(^)(id(^callback)(id element, NSInteger index, NSArray *array)))map
{
    return [^NSArray *(id(^callback)(id element, NSInteger index, NSArray *array)) {
        NSMutableArray *retval = [NSMutableArray array];
        for (NSInteger i = 0, il = self.count; i < il; i++)
            retval[i] = callback(self[i], i, self);
        return [NSArray arrayWithArray:retval];
    } autorelease];
}

-(NSArray *(^)(id(^callback)(id previousElement, id currentElement, NSInteger index, NSArray *array), /*id initialValue*/...))reduce
{
    
}

-(NSArray *(^)(id(^callback)(id previousElement, id currentElement, NSInteger index, NSArray *array), /*id initialValue*/...))reduceRight
{
    
}


@end
