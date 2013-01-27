#import "NGNewViewController.h"
#import "NGMaster.h"
#import "RandomNumber.h"
#import <QuartzCore/QuartzCore.h>

@interface NGNewViewController ()

@end

@implementation NGNewViewController {
    NGMaster *guessMaster;
    NSMutableArray *convertedArray;
    NSDictionary *guessResult;
    BOOL resetGame;

    UIButton *guessButton;
    UILabel *gameTitle;
    UILabel *gameMsg;
    UILabel *gameResult;
    UITextField *guessInput;

}


- (id)init {
    self = [super init];
    if (self) {
        RandomNumber *randomNumber = [[RandomNumber alloc] init];
        guessMaster = [[NGMaster alloc] initWithMaxCount:5 andTargetNumbers:[randomNumber create]];
        convertedArray = [[NSMutableArray alloc] init];
    }
    return self;
}

- (void)createUI {

    // create UI button
    guessButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    guessButton.frame = CGRectMake(110, 350, 100, 30);
    [guessButton setTitle:@"Guess" forState:UIControlStateNormal];
    [guessButton addTarget:self action:@selector(guess:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:guessButton];

    // create UI input
    guessInput = [[UITextField alloc] initWithFrame:CGRectMake(80, 210, 160, 30)];
    guessInput.placeholder = @"Guess Numbers";
    [guessInput setBackgroundColor:[UIColor whiteColor]];
    gameTitle.font = [UIFont systemFontOfSize:12.0];
    guessInput.textAlignment = (NSTextAlignment) UITextAlignmentCenter;
    guessInput.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    guessInput.layer.borderWidth = 1;
    guessInput.layer.borderColor = [[UIColor grayColor] CGColor];
    guessInput.layer.cornerRadius = 5.0;//Use this if you have added QuartzCore framework
    guessInput.delegate = (id) self;
    [self.view addSubview:guessInput];

    //create UI Game Title
    gameTitle = [[UILabel alloc] initWithFrame:CGRectMake(10, 80, 300, 30)];
    gameTitle.text = @"Guess Game";
    gameTitle.textColor = [UIColor blueColor];
    gameTitle.font = [UIFont fontWithName:@"Helvetica" size:30];
    gameTitle.shadowColor = [UIColor grayColor];
    gameTitle.shadowOffset = CGSizeMake(1, 1);
    gameTitle.textAlignment = (NSTextAlignment) UITextAlignmentCenter;
    gameTitle.lineBreakMode = (NSLineBreakMode) UILineBreakModeWordWrap;
    [self.view addSubview:gameTitle];

    // create UI Game Result
    gameResult = [[UILabel alloc] initWithFrame:CGRectMake(120, 160, 80, 30)];
    gameResult.text = @"";
    gameResult.font = [UIFont fontWithName:@"Helvetica" size:20];
    gameResult.shadowColor = [UIColor grayColor];
    gameResult.shadowOffset = CGSizeMake(1, 1);
    gameResult.numberOfLines = 2; // 2 lines ; 0 - dynamical number of lines
    gameResult.textAlignment = (NSTextAlignment) UITextAlignmentCenter;
    [self.view addSubview:gameResult];

    // create UI Game Message
    gameMsg = [[UILabel alloc] initWithFrame:CGRectMake(20, 270, 280, 40)];
    gameMsg.text = @"";
    gameResult.font = [UIFont fontWithName:@"Helvetica" size:16];
    gameMsg.shadowColor = [UIColor grayColor];
    gameMsg.shadowOffset = CGSizeMake(1, 1);
    gameMsg.numberOfLines = 2; // 2 lines ; 0 - dynamical number of lines
    gameMsg.textAlignment = (NSTextAlignment) UITextAlignmentCenter;
    [self.view addSubview:gameMsg];

//    CGRect frame = CGRectMake(20, 270, 280, 40);
//    CGSize labelsize = [gameMsg.text sizeWithFont:[UIFont boldSystemFontOfSize: 16]
//
//                                   constrainedToSize:CGSizeMake(320, 44)
//
//                                       lineBreakMode:UILineBreakModeTailTruncation];
//    frame.size.width = labelsize.width;
//    frame.size.height = labelsize.height;
//    gameMsg.frame = frame;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createUI];
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [guessInput resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField __unused {
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

- (void)resetUI:(id)sender {
    gameResult.text = @"";
    gameMsg.text = @"";
    guessInput.text = @"";
    [sender setTitle:@"Guess" forState:UIControlStateNormal];
    [guessMaster resetGame];
    resetGame = NO;
}

- (IBAction)guess:(id)sender {

    if (resetGame) {
        [self resetUI:sender];
        return;
    }

    if (![guessMaster isExceeded]) {
        guessResult = [guessMaster guessWithNumbers:[self convertStringToArrayWith:[[guessInput.text copy] stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceCharacterSet]]]];
        gameResult.text = [guessResult objectForKey:@"result"];
        gameMsg.text = [guessResult objectForKey:@"msg"];
    }

    if ([[guessResult objectForKey:@"isFinished"] isEqual:@"YES"] || [guessMaster isExceeded]) {
        [sender setTitle:@"Restart" forState:UIControlStateNormal];
        resetGame = YES;
    }

}

@end
