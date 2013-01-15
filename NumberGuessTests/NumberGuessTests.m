 //
//  NumberGuessTests.m
//  NumberGuessTests
//
//  Created by twer on 1/11/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "NumberGuessTests.h"
#import "RandomNumber.h"
#import "NGGuess.h"


@implementation NumberGuessTests{
    NSArray *targetNumber;
    NGGuess *guess;
    RandomNumber *randomNumber;
}


- (void)setUp {
    [super setUp];
    targetNumber = @[@"1",@"2",@"3",@"4"];
    randomNumber = [[RandomNumber alloc] init];
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
    STAssertTrue(@"1" == @"1", @"", nil);
}

- (void)testShouldReturn0A4BWhenGiveAllinCorrect{
    NSArray *guessNumber = @[@"4",@"3",@"2",@"1"];
    NSString *result = [guess compareGuessNumber:guessNumber];
    STAssertEqualObjects(@"0A4B", result, nil);
}

- (void)testShouldReturn0A2BWhenGiveExceptNumber{
    NSArray *guessNumber = @[@"2",@"5",@"1",@"9"];
    NSString *result = [guess compareGuessNumber:guessNumber];
    STAssertEqualObjects(@"0A2B", result, nil);
}

- (void)testShouldReturn2A0BWhenGiveExceptNumber{
    NSArray *guessNumber = @[@"8",@"2",@"3",@"9"];
    NSString *result = [guess compareGuessNumber:guessNumber];
    STAssertEqualObjects(@"2A0B", result, nil);
}

- (void)testShouldReturn0A0BWhenGiveExceptNumber{
    NSArray *guessNumber = @[@"8",@"7",@"6",@"5"];
    NSString *result = [guess compareGuessNumber:guessNumber];
    STAssertEqualObjects(@"0A0B", result, nil);
}

- (void)testShouldReturnRandomNumber{
    NSArray *randomNumber1 = [[guess createTargetNumber] copy];
    NSArray *randomNumber2 = [guess createTargetNumber];
    STAssertFalse([randomNumber1 isEqualToArray:randomNumber2], nil);
}

- (void)testShouldReturnRandomNumberByRandomClass{
    NSArray *r1 = [[randomNumber create] copy];
    NSArray *r2 = [randomNumber create];
    STAssertFalse([r1 isEqualToArray:r2], nil);
}

//- (void)test_should_return_7_when_you_guess_two_times{
//    NSArray *guessNumber = @[@"1",@"7",@"6",@"5"];
//    NSString *result = [guess compareGuessNumber:guessNumber];
//    STAssertEqualObjects(@"1A0B", result, nil);
//    STAssertEqualObjects(@"8", [guess leftTimes], nil);
//
//    NSArray *guessNumber1 = @[@"7",@"9",@"6",@"5"];
//    NSString *result1 = [guess compareGuessNumber:guessNumber1];
//    STAssertEqualObjects(@"0A0B", result1, nil);
//    STAssertEqualObjects(@"7", [guess leftTimes], nil);
//}



@end
