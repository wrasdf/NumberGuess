#import "NGUIViewController.h"
#import "NGGuess.h"

@interface NGUIViewController ()

@end

@implementation NGUIViewController{
    NGGuess *guessGame;
    NSMutableArray *convertedArray;
    BOOL resetGame;
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        guessGame = [[NGGuess alloc] initWithRandomNumber];
        convertedArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
//    NSLog(@"x:%d, y:%d", _gameMsg.frame.origin.x,_gameMsg.frame.origin.y);
    
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


- (void) resetUI:(id) sender {
    _resultText.text = @"";
    _gameMsg.text = @"";
    _guessInput.text = @"";
    [sender setTitle:@"Guess" forState:UIControlStateNormal];
    [guessGame reStartGuessGame];
    resetGame = NO;
}


- (IBAction)guess:(id)sender {

    if (resetGame){
        [self resetUI:sender];
        return;
    }

    if ([guessGame keepGuess]){
        NSArray *guessArray = [self convertStringToArrayWith:[[_guessInput.text copy] stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceCharacterSet]]];

        _resultText.text = [guessGame compareGuessNumber:guessArray];
        _gameMsg.text = [guessGame getGameMsg];
    }

    if ([guessGame isFinished] || ![guessGame keepGuess]){
        [sender setTitle:@"Restart" forState:UIControlStateNormal];
        resetGame = YES;
    }

}
@end
