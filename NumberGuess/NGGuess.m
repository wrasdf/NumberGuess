#import "NGGuess.h"
#import "RandomNumber.h"

@implementation NGGuess {
    NSArray *targetNumber;
    NSString *gameMessage;
    int maxNumber;
    int currentTime;
}

- (id)initWithRandomNumber {
    self = [super init];
    if (self) {
        targetNumber = [[[RandomNumber alloc] init] create];
        gameMessage = @"";
        currentTime = 0;
        maxNumber = 5;
    }
    return self;
}

- (id)initWithTargetNumber:(NSArray *)aTargetNumber {
    self = [super init];
    if (self) {
        targetNumber = aTargetNumber;
        gameMessage = @"";
        currentTime = 0;
        maxNumber = 5;
    }
    return self;
}

- (NSString *)compareGuessNumber:(NSArray *)guess {

    if (currentTime >= maxNumber){
        return @"";
    }

    if ([self isEmpty: guess]){
        gameMessage = @"Please input numbers.";
        return @"0A0B";
    }

    if ([self hasDuplicatedNumber : guess]){
        gameMessage = @"Please don't input duplicate numbers.";
        return @"0A0B";
    }



    currentTime++;
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

    if (currentTime == maxNumber && [self guessSuccess:result]){
        gameMessage = @"Congratulations. You have win this game.";
    }

    if (currentTime < maxNumber && [self guessSuccess:result]){
        gameMessage = [NSString stringWithFormat:@"Congratulations. You only use %d times to win this game.",currentTime];
    }

    if (currentTime < maxNumber && ![self guessSuccess:result]){
        gameMessage = [NSString stringWithFormat:@"You left only %d times.", (maxNumber - currentTime)];
    }

    if (currentTime == maxNumber && ![self guessSuccess:result]){
        gameMessage = @"You have failed this game.";
    }

    return result;

}

- (BOOL) guessSuccess : (NSString *)result{
    if ([result isEqual:@"4A0B"]){
        return YES;
    }else{
        return NO;
    }
}

- (NSString *)getGuessTime {
    return [NSString stringWithFormat:@"%d", currentTime];
}

- (NSString *) getGameMsg {
    return  gameMessage;
}

- (NSString *) getGameMaxNumber{
    return [NSString stringWithFormat:@"%d", maxNumber];
}

- (void)reStartGuessGame {
    currentTime = 0;
    gameMessage = @"";
    targetNumber = [self createTargetNumber];
}

- (BOOL)hasDuplicatedNumber:(NSArray *)array {
//    NSMutableSet *seen = [NSMutableSet set];
    NSMutableArray *temp = [[NSMutableArray alloc] init];
    int i = 0;
    while (i < [array count]) {
        id obj = [array objectAtIndex:i];
        if (![temp containsObject:obj]) {
            [temp addObject:obj];
        }
        i++;
    }
    if ([temp count] == 4) {
        return NO;
    }

    return YES;

}

-(BOOL) isEmpty:(NSArray *)array{
    if ([array count] == 0){
        return YES;
    }else{
        return NO;
    }

}


- (NSArray *)createTargetNumber {
    RandomNumber *randomNumber = [[RandomNumber alloc] init];
    return [randomNumber create];
}

- (BOOL) keepGuess{
    if (currentTime < maxNumber){
        return YES;
    }else{
        return NO;
    }
}

@end
