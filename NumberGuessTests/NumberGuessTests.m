 //
//  NumberGuessTests.m
//  NumberGuessTests
//
//  Created by twer on 1/11/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "NumberGuessTests.h"
#import "RandomNumber.h"
#import "NGValidation.h"
#import "NGMaster.h"



@implementation NumberGuessTests{
    NSArray *targetNumber;
    RandomNumber *randomNumber;
    NGValidation *validation;
    NGMaster *gameMaster;
}


- (void)setUp {
    [super setUp];
    targetNumber = @[@"1",@"2",@"3",@"4"];
    randomNumber = [[RandomNumber alloc] init];
    validation = [[NGValidation alloc] init];
    gameMaster = [[NGMaster alloc] initWithMaxCount:5 andTargetNumbers:targetNumber];

}

- (void)tearDown
{
    [super tearDown];
}

- (void) test_should_return_4A0B_when_give_correct_numbers{
    NSArray *guessNumbers = @[@"1",@"2",@"3",@"4"];
    NSDictionary *guessResult = [gameMaster guessWithNumbers:guessNumbers];
    STAssertEqualObjects(@"4A0B", [guessResult objectForKey:@"result"], nil);
    STAssertEqualObjects(@"Congratulations. You win this game.", [guessResult objectForKey:@"msg"], nil);
    STAssertEqualObjects(@"YES", [guessResult objectForKey:@"isFinished"], nil);
}

- (void) test_should_return_0A4B_when_give_correct_numbers{
    NSArray *guessNumbers = @[@"4",@"3",@"2",@"1"];
    NSDictionary *guessResult = [gameMaster guessWithNumbers:guessNumbers];
    STAssertEqualObjects(@"0A4B", [guessResult objectForKey:@"result"], nil);
    STAssertEqualObjects(@"You left only 4 times.", [guessResult objectForKey:@"msg"], nil);
    STAssertEqualObjects(@"NO", [guessResult objectForKey:@"isFinished"], nil);
}

- (void) test_should_return_0A2B_when_give_correct_numbers{
    NSArray *guessNumbers = @[@"6",@"0",@"2",@"3"];
    NSDictionary *guessResult = [gameMaster guessWithNumbers:guessNumbers];
    STAssertEqualObjects(@"0A2B", [guessResult objectForKey:@"result"], nil);
    STAssertEqualObjects(@"You left only 4 times.", [guessResult objectForKey:@"msg"], nil);
    STAssertEqualObjects(@"NO", [guessResult objectForKey:@"isFinished"], nil);
}


- (void)test_should_return_except_msg_when_user_input_duplicate_number{
    NSArray *guessNumbers = @[@"1",@"2",@"2",@"3"];
    NSDictionary *guessResult = [gameMaster guessWithNumbers:guessNumbers];
    STAssertEqualObjects(@"", [guessResult objectForKey:@"result"], nil);
    STAssertEqualObjects(@"Please don't input duplicate numbers.", [guessResult objectForKey:@"msg"], nil);
    STAssertEqualObjects(@"NO", [guessResult objectForKey:@"isFinished"], nil);
}

- (void)test_should_return_error_msg_when_user_input_nothing{
    NSArray *guessNumbers = @[];
    NSDictionary *guessResult = [gameMaster guessWithNumbers:guessNumbers];
    STAssertEqualObjects(@"", [guessResult objectForKey:@"result"], nil);
    STAssertEqualObjects(@"Please input numbers.", [guessResult objectForKey:@"msg"], nil);
    STAssertEqualObjects(@"NO", [guessResult objectForKey:@"isFinished"], nil);
}

- (void)test_should_return_invalided_msg_when_user_input_not_4_digits{
    NSArray *guessNumbers = @[@"1",@"l",@"2",@"3"];
    NSDictionary *guessResult = [gameMaster guessWithNumbers:guessNumbers];
    STAssertEqualObjects(@"", [guessResult objectForKey:@"result"], nil);
    STAssertEqualObjects(@"You input is not valid. You only could input 4 digal numbers between 0 - 9.", [guessResult objectForKey:@"msg"], nil);
    STAssertEqualObjects(@"NO", [guessResult objectForKey:@"isFinished"], nil);
}

- (void)test_should_return_non_equal_random_numbers{
    NSArray *rand1 = [randomNumber create];
    NSArray *rand2 = [randomNumber create];
    STAssertEqualObjects(rand1, rand2, nil, nil);
}



@end
