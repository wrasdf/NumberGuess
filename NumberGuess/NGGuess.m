//
//  NGGuess.m
//  NumberGuess
//
//  Created by twer on 1/11/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "NGGuess.h"
#import "RandomNumber.h"

@implementation NGGuess{
    NSArray *targetNumber;
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
    
    int totalA = 0;
    int totalB = 0;

    for (int i=0; i<guess.count; i++){
        if([targetNumber containsObject: guess[i]]){
            if ([targetNumber[i] isEqual: guess[i]]){
                totalA ++;
            }else{
                totalB ++;
            }
        }
    }

    return [NSString stringWithFormat: @"%dA%dB", totalA, totalB];

}

- (NSArray *) createTargetNumber {
    RandomNumber *randomNumber = [[RandomNumber alloc] init];
    return [randomNumber create];
}

@end
