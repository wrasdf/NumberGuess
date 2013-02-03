
#import "GuessForEasyTest.h"
#import "NGValidation.h"
#import "NGMaster.h"



@implementation GuessForEasyTest {
    NSArray *targetNumber;
    NGValidation *validation;
    NGMaster *gameMaster;
}


- (void)setUp {
    [super setUp];
    targetNumber = @[@"1",@"2",@"3",@"4"];
    validation = [[NGValidation alloc] init];
    gameMaster = [[NGMaster alloc] initWithMaxCount:5 andWithGameLevel:@"Easy" andTargetNumbers:targetNumber];

}

- (void)tearDown
{
    [super tearDown];
}

-(void)test_should_return_incorrect_B_list{
    NSArray *guessNumbers = @[@"4",@"2",@"3",@"1"];
    NSDictionary *guessResult = [gameMaster guessWithNumbers:guessNumbers];
    STAssertEqualObjects(@"2A2B", [guessResult objectForKey:@"result"], nil);
    STAssertEqualObjects(@"The 4,1 is not at the right place.", [guessResult objectForKey:@"msg"], nil);
    STAssertEqualObjects(@"NO", [guessResult objectForKey:@"isFinished"], nil);
}


@end