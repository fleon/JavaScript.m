//
//  JavaScript.h
//  Spellbound
//
//  Created by Fleon Games on 6/9/13.
//
//

#import <Foundation/Foundation.h>
#import "NSString+JavaScript.h"
#import "NSArray+JavaScript.h"
#import "NSRegularExpression+JavaScript.h"
#import "NSDate+JavaScript.h"

#define NaN NSIntegerMax

@interface JavaScript : NSObject

@end

@interface JavaScriptTest : NSObject

-(void)begin;

-(void)stringTest;
-(void)arrayTest;
-(void)mutableArrayTest;
-(void)dateTest;
-(void)regexpTest;

@end