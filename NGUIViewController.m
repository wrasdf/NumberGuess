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
    NGGuess *guess;
    NSArray *targetNumber;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        targetNumber = @[@"1",@"2",@"3",@"4"];
        guess = [[NGGuess alloc] initWithTargetNumber: targetNumber];
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)guess:(id)sender {
    NSLog(@"%@", _guessInput.text);
    
    
    
}
@end
