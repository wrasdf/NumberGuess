//
// Created by twer on 1/23/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGValidation.h"


@implementation NGValidation {
    NSUserDefaults *config;
}

- (id)init {
    self = [super init];
    if (self) {
        config = [NSUserDefaults standardUserDefaults];
    }

    return self;
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

- (NSString *)isValid:(NSArray *)array {

    if ([self isEmpty:array]){
        return @"Please input numbers.";
    }

    if (![self isFourDigits:array]){
        return @"You input is not valid. You only could input 4 digal numbers between 0 - 9.";
    }

    if (![[config stringForKey:@"Level"] isEqualToString:@"Hard"]){
        if ([self hasDuplicatedNumber:array]){
            return @"Please don't input duplicate numbers.";
        }
    }

    return @"";

}


@end