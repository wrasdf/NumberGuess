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
    int j = 0;
    int totalA = 0;
    int totalB = 0;
    
    for (i = 0  ; i< targetNumber.count ; i++) {
        for(j =0; j<guess.count; j++){
            if(targetNumber[i] == guess[j]){
                if(i==j){
                    totalA ++;
                }else{
                    totalB ++;
                }
            }
        }
    }
    return [NSString stringWithFormat: @"%dA%dB", totalA, totalB];

}

@end
