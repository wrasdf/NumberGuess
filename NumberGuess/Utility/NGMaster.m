
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
    NSString *gameLevel;
    NSUserDefaults *config;
    int maxCount;
    int currentCount;
}

- (id) initWithMaxCount:(int) count andWithGameLevel:(NSString *)level  andTargetNumbers:(NSArray *)targetArray{
    self = [super init];
    if (self) {
        config = [[NSUserDefaults alloc] init];
        maxCount = count;
        currentCount = 0;
        guess = [[NGGuess alloc] init];
        gameLevel = level;
        targetNumbers = targetArray;
        guessResult = [[NSMutableDictionary alloc] init];
        validation = [[NGValidation alloc] init];
        randomNumber = [[RandomNumber alloc] init];
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

    NSDictionary *resultDic = [guess compareGuessNumber:numbers andTargetNumbers:targetNumbers];
    NSString *result = [resultDic objectForKey:@"GuessResult"];
    NSArray *guessBArray = [resultDic objectForKey:@"GuessBList"];

    if ([result isEqual:@"4A0B"]){
        return [self generateResult:result andMsg:[NSString stringWithFormat:@"Congratulations. You win this game."] andIsFinished:@"YES"];
    }else{
        if ([self isExceeded]){
            return [self generateResult:result andMsg:@"You have failed this game." andIsFinished:@"NO"];
        }

        if ([gameLevel isEqual:@"Easy"]){
            return [self generateResult:result andMsg:[NSString stringWithFormat:@"The %@ is not at the right place.",[guessBArray componentsJoinedByString:@","]] andIsFinished:@"NO"];
        }else{
            return [self generateResult:result andMsg:[NSString stringWithFormat:@"You left only %d times.", (maxCount - currentCount)] andIsFinished:@"NO"];
        }
    }

}

- (void) resetGame {
    currentCount = 0;
    maxCount = [config integerForKey:@"GuessTimes"];
    gameLevel = [config stringForKey:@"Level"];
    targetNumbers = [randomNumber createWithLevel:gameLevel];
    [guessResult removeAllObjects];
}


@end