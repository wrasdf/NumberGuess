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
#import "NGValidation.h"



@implementation NumberGuessTests{
    NSArray *targetNumber;
    NGGuess *guess;
    RandomNumber *randomNumber;
    NGValidation *validation;
}


- (void)setUp {
    [super setUp];
    targetNumber = @[@"1",@"2",@"3",@"4"];
    randomNumber = [[RandomNumber alloc] init];
    validation = [[NGValidation alloc] init];
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

- (void)testShouldReturnRandomNumberByRandomClass{
    NSArray *r1 = [[randomNumber create] copy];
    NSArray *r2 = [randomNumber create];
    STAssertFalse([r1 isEqualToArray:r2], nil);
}

- (void)test_should_return_correct_guess_times{
    NSArray *guessNumber1 = @[@"8",@"7",@"6",@"5"];
    [guess compareGuessNumber:guessNumber1];
    NSArray *guessNumber2 = @[@"1",@"7",@"6",@"5"];
    [guess compareGuessNumber:guessNumber2];
    int currentResultTimes = [guess getGuessTime];
    STAssertEquals(2, currentResultTimes, nil);
}

- (void)test_should_return_except_msg_when_user_input_duplicate_number{
    NSArray *guessNumber1 = @[@"7",@"7",@"6",@"5"];
    NSString *result = [guess compareGuessNumber:guessNumber1];
    STAssertEqualObjects(@"", result, nil);
    STAssertEqualObjects(@"Please don't input duplicate numbers.", [guess getGameMsg], nil);
}

- (void)test_should_return_error_message_when_input_nothing{
    NSArray *guessNumber = @[];
    NSString *result = [guess compareGuessNumber:guessNumber];
    NSString *msg = [guess getGameMsg];
    STAssertEqualObjects(@"", result, nil);
    STAssertEqualObjects(@"Please input numbers.", msg, nil);
}

- (void)test_should_return_congratulations_when_we_guess_once_to_win_the_game{
    NSArray *guessNumber = @[@"1",@"2",@"3",@"4"];
    NSString *result = [guess compareGuessNumber:guessNumber];
    NSString *msg = [guess getGameMsg];
    STAssertEqualObjects(@"4A0B", result, nil);
    STAssertEqualObjects(@"Congratulations. You only use 1 times to win this game.", msg, nil);
}

- (void)test_should_return_congratulations_when_we_win_games{
    NSArray *guessNumber = @[@"1",@"2",@"3",@"4"];
    NSString *result = [guess compareGuessNumber:guessNumber];
    NSString *msg = [guess getGameMsg];
    STAssertEqualObjects(@"4A0B", result, nil);
    STAssertEqualObjects(@"Congratulations. You only use 1 times to win this game.", msg, nil);
}

- (void)test_should_return_non_equal_random_numbers{
    NSArray *rand1 = [randomNumber create];
    NSArray *rand2 = [randomNumber create];
    STAssertEqualObjects(rand1, rand2, nil, nil);
}

- (void)test_should_return_true_you_input_correct_numbers{
    NSArray *guessNumber = @[@"1",@"2",@"3",@"4"];
    BOOL isFourNumbers = [validation isFourDigits:guessNumber];
    BOOL isEmptyBool = [validation isEmpty:guessNumber];
    BOOL hasDuplicatedNumberBool = [validation hasDuplicatedNumber:guessNumber];
    STAssertTrue(isFourNumbers == YES, nil);
    STAssertTrue(isEmptyBool == NO, nil);
    STAssertTrue(hasDuplicatedNumberBool == NO, nil);
}

- (void)test_should_return_false_you_input_incorrect_numbers{
    NSArray *guessNumber1 = @[@"1",@"g",@"3",@"4"];
    NSArray *guessNumber2 = @[@"1",@"1",@"3",@"4"];
    BOOL isFourNumbers = [validation isFourDigits:guessNumber1];
    BOOL isEmptyBool = [validation isEmpty:guessNumber2];
    BOOL hasDuplicatedNumberBool = [validation hasDuplicatedNumber:guessNumber2];
    STAssertTrue(isFourNumbers == NO, nil);
    STAssertTrue(isEmptyBool == NO, nil);
    STAssertTrue(hasDuplicatedNumberBool == YES, nil);
}



@end
