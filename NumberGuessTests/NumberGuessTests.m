//
//  NumberGuessTests.m
//  NumberGuessTests
//
//  Created by twer on 1/11/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "NumberGuessTests.h"
#import "NGGuess.h"

@implementation NumberGuessTests{
    NSArray *targetNumber;
    NGGuess *guess;
}


- (void)setUp {
    [super setUp];
    targetNumber = @[@"1",@"2",@"3",@"4"];
    guess = [[NGGuess alloc] initWithTargetNumber: targetNumber];
}

- (void)tearDown
{
    [super tearDown];
}

- (void)testShouldReturn4A0BWhenGiveAllCorrect{
    NSArray *guessNumber = @[@"1",@"2",@"3",@"4"];
    NSString *result = [guess compareGuessNumber:guessNumber];
    STAssertEqualObjects(@"4A0B", result, nil);
}

- (void)testShouldReturn0A4BWhenGiveAllinCorrect{
    NSArray *guessNumber = @[@"4",@"3",@"2",@"1"];
    NSString *result = [guess compareGuessNumber:guessNumber];
    STAssertEqualObjects(@"0A4B", result, nil);
}


- (void)testShouldReturn0A1BWhenGiveExceptNumber{
    NSArray *guessNumber = @[@"2",@"5",@"7",@"9"];
    NSString *result = [guess compareGuessNumber:guessNumber];
    STAssertEqualObjects(@"0A1B", result, nil);
}

- (void)testShouldReturnRandomNumber{
    NSArray *randomNumber1 = [guess createTargetNumber];
    NSArray *randomNumber2 = [guess createTargetNumber];
    NSLog(randomNumber1,randomNumber2);                    // ?? assertNotEuqal
    STAssertEqualObjects(randomNumber1, randomNumber2, nil);
}




@end
