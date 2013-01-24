//
// Created by twer on 1/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface NGValidation : NSObject

- (BOOL) isFourDigits:(NSArray *) array;
- (BOOL) hasDuplicatedNumber:(NSArray *)array;
- (BOOL) isEmpty:(NSArray *)array;
- (BOOL) guessSuccess : (NSString *) result;

@end