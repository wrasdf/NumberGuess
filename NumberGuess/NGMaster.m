
#import "NGMaster.h"
#import "RandomNumber.h"
#import "NGGuess.h"
#import "NGValidation.h"


@implementation NGMaster {
    NGGuess *guess;
    RandomNumber *randomNumber;
    NGValidation *validation;
    NSArray *targetNumbers;
    NSMutableDictionary *guessResult;
    int maxCount;
    int currentCount;
}

- (id) initWithMaxCount:(int) count andTargetNumbers:(NSArray *)targetArray{
    self = [super init];
    if (self) {
        maxCount = count;
        currentCount = 0;
        guess = [[NGGuess alloc] init];
        targetNumbers = targetArray;
        guessResult = [[NSMutableDictionary alloc] init];
        validation = [[NGValidation alloc] init];
    }
    return self;
}


- (BOOL) isExceeded{
    return currentCount >= maxCount;
}


- (NSDictionary *) generateResult:(NSString *)result andMsg:(NSString *)msg andIsFinished:(NSString *) isFinished{
    [guessResult removeAllObjects];
    [guessResult setObject:result forKey:@"result"];
    [guessResult setObject:msg forKey:@"msg"];
    [guessResult setObject:isFinished forKey:@"isFinished"];
    return guessResult;
}

- (NSDictionary *) guessWithNumbers:(NSArray *) numbers{

    NSString *isValidMsg = [validation isValid:numbers];

    if (isValidMsg != @""){
        return [self generateResult:@"" andMsg:isValidMsg andIsFinished:@"NO"];
    }

    currentCount ++;

    NSString *result = [guess compareGuessNumber:numbers andTargetNumbers:targetNumbers];

    if ([result isEqual:@"4A0B"]){
        return [self generateResult:result andMsg:[NSString stringWithFormat:@"Congratulations. You win this game.",currentCount] andIsFinished:@"YES"];
    }else{
        if ([self isExceeded]){
            return [self generateResult:result andMsg:@"You have failed this game." andIsFinished:@"NO"];
        }
        return [self generateResult:result andMsg:[NSString stringWithFormat:@"You left only %d times.", (maxCount - currentCount)] andIsFinished:@"NO"];
    }

}

- (void) resetGame {
    currentCount = 0;
    targetNumbers = [randomNumber create];
    [guessResult removeAllObjects];
}


@end