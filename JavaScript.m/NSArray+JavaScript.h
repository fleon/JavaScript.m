//
//  NSArray+JavaScript.h
//  Spellbound
//
//  Created by Fleon Games on 6/9/13.
//
//

#import <Foundation/Foundation.h>

@interface NSArray (JavaScript)

-(NSArray *(^)(id itemOrArray, ...))concat;
-(BOOL(^)(NSArray *array))equals;
-(NSInteger(^)(id item, /*NSInteger index*/...))indexOf;
-(NSInteger(^)(id item, /*NSInteger index*/...))lastIndexOf;
-(NSString *(^)(NSString *separator))join;
-(NSArray *(^)(NSInteger begin, NSInteger end))slice;

-(void(^)(void(^callback)(id element, NSInteger index, NSArray *array)))forEach;
-(BOOL(^)(BOOL(^callback)(id element, NSInteger index, NSArray *array)))every;
-(BOOL(^)(BOOL(^callback)(id element, NSInteger index, NSArray *array)))some;
-(NSArray *(^)(BOOL(^callback)(id element, NSInteger index, NSArray *array)))filter;
-(NSArray *(^)(id(^callback)(id element, NSInteger index, NSArray *array)))map;
-(NSArray *(^)(id(^callback)(id previousElement, id currentElement, NSInteger index, NSArray *array), /*id initialValue*/...))reduce;
-(NSArray *(^)(id(^callback)(id previousElement, id currentElement, NSInteger index, NSArray *array), /*id initialValue*/...))reduceRight;

#define reduce(array...) reduce(array, nil)
#define reduceRight(array...) reduceRight(array, nil)

@end

@interface NSMutableArray (JavaScript)

-(id(^)(void))pop;
-(NSInteger(^)(id element, ...))push;
-(NSMutableArray *(^)(void))reverse;
-(id(^)(void))shift;
-(NSMutableArray *(^)())sort;
-(NSMutableArray *(^)(BOOL(^comparator)(NSInteger a, NSInteger b)))sortBy;
-(NSMutableArray *(^)(NSInteger index, NSInteger howMany, ...))splice;
-(NSInteger(^)(id element, ...))unshift;

#define splice(array...) splice(array, nil)

@end