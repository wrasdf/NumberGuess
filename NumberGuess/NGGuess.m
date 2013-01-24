#import "NGGuess.h"
#import "RandomNumber.h"
#import "NGValidation.h"


@implementation NGGuess {
    NSArray *targetNumber;
    NSString *gameMessage;
    NGValidation *validation;
    RandomNumber *randomNumber;
    int maxCount;
    int currentCount;
    BOOL finishedGuess;
}

- (id)initWithRandomNumber {
    self = [super init];
    if (self) {
        randomNumber = [[RandomNumber alloc] init];
        targetNumber = [randomNumber create];
        validation = [[NGValidation alloc] init];
        gameMessage = @"";
        currentCount = 0;
        maxCount = 5;
        finishedGuess = NO;
    }
    return self;
}

- (id)initWithTargetNumber:(NSArray *)aTargetNumber {
    self = [super init];
    if (self) {
        targetNumber = aTargetNumber;
        validation = [[NGValidation alloc] init];
        gameMessage = @"";
        currentCount = 0;
        maxCount = 5;
        finishedGuess = NO;
    }
    return self;
}

- (NSString *)compareGuessNumber:(NSArray *)guess {

    if (currentCount >= maxCount){
        return @"";
    }

    if ([validation isEmpty: guess]){
        gameMessage = @"Please input numbers.";
        return @"";
    }

    if (![validation isFourDigits:guess]){
        gameMessage = @"You input is not valid. You only could input 4 digal numbers between 0 - 9.";
        return @"";
    }

    if ([validation hasDuplicatedNumber : guess]){
        gameMessage = @"Please don't input duplicate numbers.";
        return @"";
    }

    currentCount++;
    int totalA = 0;
    int totalB = 0;


    for (int i = 0; i < guess.count; i++) {
        if ([targetNumber containsObject:guess[i]]) {
            if ([targetNumber[i] isEqual:guess[i]]) {
                totalA++;
            } else {
                totalB++;
            }
        }
    }

    NSString *result = [NSString stringWithFormat:@"%dA%dB", totalA, totalB];

    if([validation guessSuccess:result]){

        if (currentCount == maxCount){
            gameMessage = @"Congratulations. You have win this game.";
        }

        if (currentCount < maxCount){
            gameMessage = [NSString stringWithFormat:@"Congratulations. You only use %d times to win this game.", currentCount];
        }

        finishedGuess = YES;

    }else{

        if (currentCount < maxCount){
            gameMessage = [NSString stringWithFormat:@"You left only %d times.", (maxCount - currentCount)];
        }

        if (currentCount == maxCount){
            gameMessage = @"You have failed this game.";
        }

        finishedGuess = NO;

    }

    return result;

}

- (int )getGuessTime {
    return currentCount;
}

- (NSString *) getGameMsg {
    return  gameMessage;
}

- (void)reStartGuessGame {
    currentCount = 0;
    gameMessage = @"";
    targetNumber = [randomNumber create];
}


- (BOOL) isFinished{
     return finishedGuess;
}

- (BOOL) keepGuess{
    if (currentCount < maxCount){
        return YES;
    }else{
        return NO;
    }
}

@end
