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
}


- (id)init {
    self = [super init];
    if (self) {
        RandomNumber *randomNumber = [[RandomNumber alloc] init];
        guessMaster = [[NGMaster alloc] initWithMaxCount:5 andTargetNumbers:[randomNumber create]];
        convertedArray = [[NSMutableArray alloc] init];
        self.title = @"Game View";
    }
    return self;
}

- (void)loadView {
    gameView = [[NGGameView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49)];
    gameView.delegte = self;
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

- (void)resetUI:(id)sender {
    [gameView resetUI];
    [guessMaster resetGame];
    resetGame = NO;
}

- (IBAction)guess:(id)sender {

    if (resetGame) {
        [self resetUI:sender];
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
