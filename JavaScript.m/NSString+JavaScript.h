//
//  NSString+JSString.h
//  Spellbound
//
//  Created by Fleon Games on 6/9/13.
//
//

#import <Foundation/Foundation.h>

typedef int JSStringCharAtBlock;

@interface NSString (JavaScript)

// todo: convert NSIntegers to NSUIntegers where appropriate

-(NSString *(^)(NSInteger index))charAt;
-(NSInteger(^)(NSInteger index))charCodeAt;
-(NSString *(^)(NSString *string, ...))concat;
-(BOOL(^)(NSString *string))equals;
-(NSInteger(^)(NSString *string, /*NSInteger index*/...))indexOf;
-(NSInteger(^)(NSString *string, /*NSInteger index*/...))lastIndexOf;
-(NSString *(^)(id regexpOrString, id stringOrBlock))replace;
-(NSInteger(^)(NSRegularExpression *regexp))search;
-(NSString *(^)(NSInteger begin, /*NSInteger end*/...))slice;
-(NSArray *(^)(id regexpOrString, /*NSInteger count*/...))split;
-(NSString *(^)(NSInteger begin, /*NSInteger length*/...))substr;
-(NSString *(^)(NSInteger begin, /*NSInteger end*/...))substring;
-(NSString *(^)(void))toLowerCase;
-(NSString *(^)(void))toUpperCase;
-(NSString *(^)(void))trim;
-(NSString *(^)(void))trimLeft;
-(NSString *(^)(void))trimRight;

#define concat(strings...) concat(strings, nil)
#define indexOf(string...) indexOf(string, NaN)
#define lastIndexOf(string...) lastIndexOf(string, NaN)
#define slice(string...) slice(string, NaN)
#define split(string...) split(string, NaN)
#define substr(string...) substr(string, NaN)
#define substring(string...) substring(string, NaN)

#define _ ).concat(

@end