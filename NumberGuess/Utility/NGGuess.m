#import "NGGuess.h"

@implementation NGGuess {
    NSMutableDictionary *guessResult;
    NSMutableArray *guessAList;
    NSMutableArray *guessBList;
}

- (id)init {
    self = [super init];
    if (self) {
        guessResult = [[NSMutableDictionary alloc] init];
        guessAList = [[NSMutableArray alloc] init];
        guessBList = [[NSMutableArray alloc] init];
    }

    return self;
}


- (NSDictionary *)compareGuessNumber:(NSArray *) guessNumbers andTargetNumbers:(NSArray *) targetNumbers{

    [guessResult removeAllObjects];
    [guessAList removeAllObjects];
    [guessBList removeAllObjects];

    int totalA = 0;
    int totalB = 0;

    for (int i = 0; i < guessNumbers.count; i++) {
        if ([targetNumbers containsObject:guessNumbers[i]]) {
            if ([targetNumbers[i] isEqual:guessNumbers[i]]) {
                [guessAList addObject:guessNumbers[i]];
                totalA++;
            } else {
                [guessBList addObject:guessNumbers[i]];
                totalB++;
            }
        }
    }
    [guessResult setObject:guessAList forKey:@"GuessAList"];
    [guessResult setObject:guessBList forKey:@"GuessBList"];
    [guessResult setObject:[NSString stringWithFormat:@"%dA%dB", totalA, totalB] forKey:@"GuessResult"];

    return guessResult;
}

@end
