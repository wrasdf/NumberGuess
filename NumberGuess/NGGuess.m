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
    NSString *gameMessage;
    int maxNumber;
    int currentTime;
}

- (id)initWithRandomNumber{
    self = [super init];
    if (self) {
        targetNumber = [[[RandomNumber alloc] init] create];
        gameMessage = @"";
        currentTime = 0;
        maxNumber = 5;
    }
    return self;
}

- (id)initWithTargetNumber:(NSArray *)aTargetNumber
{
    self = [super init];
    if (self) {
        targetNumber = aTargetNumber;
        gameMessage = @"";
        currentTime = 0;
        maxNumber = 5;
    }
    return self;
}

- (NSString *) compareGuessNumber:(NSArray *)guess{
    
    if (currentTime < maxNumber){
        gameMessage = [NSString stringWithFormat:@"You left only %d times.",(maxNumber - currentTime)];
    }else{
        gameMessage = @"You have failed this game.";
    }

    currentTime ++;
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

- (NSString *) getGuessTime {
    return [NSString stringWithFormat: @"%d", currentTime];
}

- (void) reStartGuessGame{
    currentTime = 0;
    gameMessage = @"";
    targetNumber = [self createTargetNumber];
}


- (NSArray *) createTargetNumber {
    RandomNumber *randomNumber = [[RandomNumber alloc] init];
    return [randomNumber create];
}

@end
