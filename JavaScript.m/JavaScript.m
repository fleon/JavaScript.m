//
//  JavaScript.m
//  Spellbound
//
//  Created by Fleon Games on 6/9/13.
//
//

#import "JavaScript.h"

NSInteger test(NSInteger arg, ...)
{
    va_list args;
    va_start(args, arg);
    NSInteger arg2 = va_arg(args, NSInteger);
    return arg + arg2;
}

@implementation JavaScript

@end

@implementation JavaScriptTest : NSObject

-(void)begin
{
    [self stringTest];
    [self arrayTest];
    [self mutableArrayTest];
    [self dateTest];
    [self regexpTest];
}

-(void)stringTest
{
    // preliminary test - equals
    NSArray *array1 = @[@1, @2, @3];
    NSArray *array2 = @[@1, @2, @3];
    assert(array1.equals(array2));
    assert(@"hello".equals(@"hello"));
    assert(@"world".equals(@"world"));
    
    // charAt test
    NSString *anyString = @"Brave new world";
    
    assert(anyString.charAt(0).equals(@"B"));
    assert(anyString.charAt(1).equals(@"r"));
    assert(anyString.charAt(2).equals(@"a"));
    assert(anyString.charAt(3).equals(@"v"));
    assert(anyString.charAt(4).equals(@"e"));
    assert(anyString.charAt(999).equals(@""));
    
    // charCodeAt test
    assert(anyString.charCodeAt(0) == 'B');
    assert(anyString.charCodeAt(999) == NaN);
    
    // concat test
    NSString *hello = @"Hello, ";
    assert(hello.concat(@"Kevin", @" have a nice day.").equals(@"Hello, Kevin have a nice day."));
    
    // indexOf test
    assert(@"Blue Whale".indexOf(@"Blue") == 0);
    assert(@"Blue Whale".indexOf(@"Blute") == -1);
    assert(@"Blue Whale".indexOf(@"Whale", 0) == 5);
    assert(@"Blue Whale".indexOf(@"Whale", 5) == 5);
    assert(@"Blue Whale".indexOf(@"", 9) == 9);
    assert(@"Blue Whale".indexOf(@"", 10) == 10);
    assert(@"Blue Whale".indexOf(@"", 11) == 11);
    assert(@"Blue Whale".indexOf(@"blue") == -1);
    
    assert(anyString.indexOf(@"w") == 8);
    assert(anyString.lastIndexOf(@"w") == 10);
    assert(anyString.indexOf(@"new") == 6);
    assert(anyString.lastIndexOf(@"new") == 6);
    
    NSString *myString = @"brie, pepper jack, cheddar";
    NSString *myCapString = @"Brie, Pepper Jack, Cheddar";
    
    assert(myString.indexOf(@"cheddar") == 19);
    assert(myCapString.indexOf(@"cheddar") == -1);
    
    // lastIndexOf test
    assert(@"canal".lastIndexOf(@"a") == 3);
    assert(@"canal".lastIndexOf(@"a", 2) == 1);
    assert(@"canal".lastIndexOf(@"a", 0) == -1);
    assert(@"canal".lastIndexOf(@"x") == -1);
    
    // slice test
    NSString *str1 = @"The morning is upon us.";
    NSString *str2 = str1.slice(4, -2l);
    assert(str2.equals(@"morning is upon u"));
    
    assert(str1.slice(-3).equals(@"us."));
    assert(str1.slice(-3, -1l).equals(@"us"));
    assert(str1.slice(0, -1l).equals(@"The morning is upon us"));
    
    // split test
    NSString *tempestString = @"Oh brave new world that has such people in it.";
    NSArray *tempestArray = @[@"Oh", @"brave", @"new", @"world", @"that", @"has", @"such", @"people", @"in", @"it."];
    NSString *monthString = @"Jan,Feb,Mar,Apr,May,Jun,Jul,Aug,Sep,Oct,Nov,Dec";
    NSArray *monthArray = @[@"Jan", @"Feb", @"Mar", @"Apr", @"May", @"Jun", @"Jul", @"Aug", @"Sep", @"Oct", @"Nov", @"Dec"];
    
    assert(tempestString.split(@" ").equals(tempestArray));
    assert(monthString.split(@",").equals(monthArray));
    
    NSString *helloWorld = @"Hello World. How are you doing?";
    NSArray *helloWorldArray = @[@"Hello", @"World.", @"How"];
    
    assert(helloWorld.split(@" ", 3).equals(helloWorldArray));
    
    // substr test
    NSString *str = @"abcdefghij";
    
    assert(str.substr(1, 2).equals(@"bc"));
    assert(str.substr(-3, 2).equals(@"hi"));
    assert(str.substr(-3).equals(@"hij"));
    assert(str.substr(1).equals(@"bcdefghij"));
    assert(str.substr(-20, 2).equals(@"ab"));
    assert(str.substr(20, 2).equals(@""));
    
    // substring test
    NSString *mozilla = @"Mozilla";
    
    assert(mozilla.substring(0, 3).equals(@"Moz"));
    assert(mozilla.substring(3, 0).equals(@"Moz"));
    assert(mozilla.substring(4, 7).equals(@"lla"));
    assert(mozilla.substring(7, 4).equals(@"lla"));
    assert(mozilla.substring(0, 6).equals(@"Mozill"));
    assert(mozilla.substring(0, 7).equals(@"Mozilla"));
    assert(mozilla.substring(0, 10).equals(@"Mozilla"));
    
    // toLowerCase test
    assert(@"Hello World".toLowerCase().equals(@"hello world"));
    
    // toUpperCase test
    assert(@"Hello World".toUpperCase().equals(@"HELLO WORLD"));
    
    
    // trim test
    assert(@"   hello  ".trim().equals(@"hello"));
    assert(@"\r\n  hello  \t\r\n  ".trim().equals(@"hello"));
    
    // trimLeft test
    assert(@"\r\n  hello  \t\r\n  ".trimLeft().equals(@"hello  \t\r\n  "));
    
    // trimRight test
    NSLog(@"%@", @"\r\n  hello  \t\r\n  ".trimRight());
    assert(@"\r\n  hello  \t\r\n  ".trimRight().equals(@"\r\n  hello"));
}

-(void)arrayTest
{
    
}

-(void)mutableArrayTest
{
    
}

-(void)dateTest
{
    
}

-(void)regexpTest
{
    
}

@end