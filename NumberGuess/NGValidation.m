//
// Created by twer on 1/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGValidation.h"


@implementation NGValidation {

}

- (BOOL)isFourDigits:(NSArray *)array {
    NSString *searchString = [array componentsJoinedByString:@""];
    NSString *fourDigitRegexp = @"^\\d{4}$";
    NSPredicate *predicate = [NSPredicate predicateWithFormat:@"self matches %@", fourDigitRegexp];
    return [predicate evaluateWithObject:searchString];
}

- (BOOL)hasDuplicatedNumber:(NSArray *)array {
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    int i = 0;
    while (i < [array count]) {
        id obj = [array objectAtIndex:i];
        if (![temp containsObject:obj]) {
            [temp addObject:obj];
        }
        i++;
    }
    return [temp count] != 4;
}

- (BOOL)isEmpty:(NSArray *)array {
    return [array count] == 0;
}

- (BOOL)guessSuccess :(NSString *)result {
    return [result isEqual:@"4A0B"];
}

@end