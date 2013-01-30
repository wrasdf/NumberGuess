#import "NGGuess.h"

@implementation NGGuess {
}

- (NSString *)compareGuessNumber:(NSArray *) guessNumbers andTargetNumbers:(NSArray *) targetNumbers{

    int totalA = 0;
    int totalB = 0;

    for (int i = 0; i < guessNumbers.count; i++) {
        if ([targetNumbers containsObject:guessNumbers[i]]) {
            if ([targetNumbers[i] isEqual:guessNumbers[i]]) {
                totalA++;
            } else {
                totalB++;
            }
        }
    }

    return [NSString stringWithFormat:@"%dA%dB", totalA, totalB];

}

@end
