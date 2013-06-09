//
//  NSRegularExpression+JavaScript.m
//  Spellbound
//
//  Created by Fleon Games on 6/9/13.
//
//

#import "JavaScript.h"

NSRegularExpression *RegExp(NSString *regexpString)
{
    return [NSRegularExpression regularExpressionWithPattern:regexpString options:NSRegularExpressionCaseInsensitive error:nil];
}

@implementation NSRegularExpression (JavaScript)

@end
