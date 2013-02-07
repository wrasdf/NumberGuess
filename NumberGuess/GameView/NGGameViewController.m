#import "NGGameViewController.h"
#import "NGMaster.h"
#import "RandomNumber.h"
#import "NGGameView.h"

@interface NGGameViewController ()

@end

@implementation NGGameViewController {
    NGMaster *guessMaster;
    NSMutableArray *convertedArray;
    NSDictionary *guessResult;
    BOOL resetGame;
    NGGameView *gameView;
    NSUserDefaults *config;
    NSNotificationCenter *notificationCenter;
}


- (id)init {
    self = [super init];
    if (self) {
        config = [NSUserDefaults standardUserDefaults];
        notificationCenter = [NSNotificationCenter defaultCenter];
        RandomNumber *randomNumber = [[RandomNumber alloc] init];
        guessMaster = [[NGMaster alloc] initWithMaxCount:[config integerForKey:@"GuessTimes"]  andWithGameLevel:[config stringForKey:@"Level"]  andTargetNumbers:[randomNumber createWithLevel:[config stringForKey:@"Level"]]];
        convertedArray = [[NSMutableArray alloc] init];
        [notificationCenter addObserver:self selector:@selector(resetGame:) name:@"NGResetGame" object:nil];
        self.title = @"Game View";
    }
    return self;
}

- (void)loadView {
    gameView = [[NGGameView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49)];
    gameView.delegate = self;
    self.view = gameView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (NSMutableArray *)convertStringToArrayWith:(NSString *)string {

    convertedArray = [NSMutableArray arrayWithCapacity:[string length]];
    for (int i = 0; i < string.length; i++) {
        [convertedArray addObject:[NSString stringWithFormat:@"%C", [string characterAtIndex:i]]];
    }
    return convertedArray;

}


- (void)resetGame:(id)sender {
    NSLog(@"This is in game controller reset functions");
    [gameView resetUI];
    [guessMaster resetGame];
    resetGame = NO;
}

- (IBAction)guess:(id)sender {

    if (resetGame) {
        [self resetGame:sender];
        return;
    }

    if (![guessMaster isExceeded]) {
        guessResult = [guessMaster guessWithNumbers:[self convertStringToArrayWith:[[[gameView getInputText] copy] stringByTrimmingCharactersInSet:
                [NSCharacterSet whitespaceCharacterSet]]]];
        [gameView executedWithResult: guessResult];
    }

    if ([[guessResult objectForKey:@"isFinished"] isEqual:@"YES"] || [guessMaster isExceeded]) {
        [gameView setGuessButtonText:@"Restart"];
        resetGame = YES;
    }

}

@end
