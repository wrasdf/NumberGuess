//
//  NGGuess.m
//  NumberGuess
//
//  Created by twer on 1/11/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "NGGuess.h"

@implementation NGGuess{
    NSArray *targetNumber;
    NSMutableArray *tempArr;
}

- (id)initWithTargetNumber:(NSArray *)aTargetNumber
{
    self = [super init];
    if (self) {
        targetNumber = aTargetNumber;
    }
    return self;
}

- (NSString *) compareGuessNumber:(NSArray *)guess{
    
    int i = 0;
    int totalA = 0;
    int totalB = 0;

    for (i=0; i<guess.count; i++){
        if([targetNumber containsObject: guess[i]]){
            if (targetNumber[i] == guess[i]){
                totalA ++;
            }else{
                totalB ++;
            }
        }
    }

    return [NSString stringWithFormat: @"%dA%dB", totalA, totalB];

}

- (int) getRandomNumber:(int)from to:(int)to{
    return from + arc4random() % (to-from+1);
}

- (BOOL) isContainsNumber:(int)number in:(NSMutableArray *)array {

    BOOL *result = FALSE;

    if (!array.count || array.count == 0){
        return (BOOL) result;                                          //?
    }

    for(int i = 0; i < array.count; i++){
        if (array[(NSUInteger) i] == [NSNumber numberWithInt:number]){ //?
            result = (BOOL *) TRUE;
            break;
        }
    }

    return (BOOL) result;
}

- (void) insertNonDuplicatedNumber {
    if (tempArr.count < 4){
        int randomNumber = [self getRandomNumber:0 to:9];
        NSLog(@"%@",[self isContainsNumber:randomNumber in:tempArr]);
        if ([self isContainsNumber:randomNumber in:tempArr]){
            [self insertNonDuplicatedNumber];
        }else{
            NSLog(@"%d",123);
            [tempArr addObject: [NSNumber numberWithInt:randomNumber]];
            NSLog(@"%@",tempArr);
        }
    }
}

- (NSArray *) createTargetNumber {
    [tempArr removeAllObjects];
    for (int i=0; i<4; i++){
        [self insertNonDuplicatedNumber];
    }
    NSLog(@"%@", tempArr);
    return tempArr;
}

@end
