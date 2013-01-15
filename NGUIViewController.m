//
//  NGUIViewController.m
//  NumberGuess
//
//  Created by twer on 1/14/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "NGUIViewController.h"
#import "NGGuess.h"

@interface NGUIViewController ()

@end

@implementation NGUIViewController{
    NGGuess *guessGame;
    NSArray *targetNumber;
    NSMutableArray *convertedArray;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        targetNumber = @[@"1",@"2",@"3",@"4"];
        convertedArray = [[NSMutableArray alloc] init];
        guessGame = [[NGGuess alloc] initWithTargetNumber: targetNumber];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _guessInput.delegate = self;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [_guessInput resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    [textField resignFirstResponder];
    return YES;
}


- (NSMutableArray *)convertStringToArrayWith:(NSString *)string {

    convertedArray = [NSMutableArray arrayWithCapacity:[string length]];
    for (int i = 0; i < string.length; i++) {
        [convertedArray addObject:[NSString stringWithFormat:@"%C", [string characterAtIndex:i]]];
    }
    return convertedArray;

}

- (IBAction)guess:(id)sender {
    NSString *trimmedInputText = [[_guessInput.text copy] stringByTrimmingCharactersInSet:
                               [NSCharacterSet whitespaceCharacterSet]];
    NSArray *guessArray = [self convertStringToArrayWith:trimmedInputText];
    NSString *result = [guessGame compareGuessNumber:guessArray];
    _resultText.text = result;
}
@end
