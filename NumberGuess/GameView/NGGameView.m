//
// Created by twer on 1/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGGameView.h"
#import "NGGameViewController.h"
#import "CreateUIElement.h"
#import <QuartzCore/QuartzCore.h>

@implementation NGGameView {
    UIButton *guessButton;
    UILabel *gameTitle;
    UILabel *gameMsg;
    UILabel *gameResult;
    UITextField *guessInput;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }

    return self;
}

- (void)createUI {

    //create UI Game Title
    gameTitle = [[CreateUIElement alloc] createLabelWithCGRect:CGRectMake(10, 40, 300, 40) andWithTitle:@"Guess Game"];
    gameTitle.textColor = [UIColor blueColor];
    gameTitle.font = [UIFont fontWithName:@"Helvetica" size:40];
    gameTitle.shadowColor = [UIColor grayColor];
    gameTitle.shadowOffset = CGSizeMake(1, 1);
    [self addSubview:gameTitle];

    // create UI button
    guessButton = [[CreateUIElement alloc] createButtonWithCGRect:CGRectMake(50, 330, 220, 40) andWithTitle:@"Guess"];
    [guessButton addTarget:_delegate action:@selector(guess:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:guessButton];

    // create UI input
    guessInput = [[CreateUIElement alloc] createTextFieldWithCGRect:CGRectMake(50, 190, 220, 40)];
    guessInput.placeholder = @"Guess your Numbers";
    guessInput.delegate = self;
    [self addSubview:guessInput];

    // create UI Game Result
    gameResult = [[CreateUIElement alloc] createLabelWithCGRect:CGRectMake(120, 140, 80, 30) andWithTitle:@""];
    gameResult.font = [UIFont fontWithName:@"Helvetica" size:20];
    gameResult.shadowColor = [UIColor grayColor];
    gameResult.shadowOffset = CGSizeMake(1, 1);
    gameResult.numberOfLines = 2; // 2 lines ; 0 - dynamical number of lines
    [self addSubview:gameResult];

    // create UI Game Message
    gameMsg = [[CreateUIElement alloc] createLabelWithCGRect:CGRectMake(20, 250, 280, 40) andWithTitle:@""];
    gameResult.font = [UIFont fontWithName:@"Helvetica" size:16];
    gameMsg.shadowColor = [UIColor grayColor];
    gameMsg.shadowOffset = CGSizeMake(1, 1);
    gameMsg.numberOfLines = 2; // 2 lines ; 0 - dynamical number of lines
    [self addSubview:gameMsg];

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

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [guessInput resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField __unused {
    [textField resignFirstResponder];
    return YES;
}

- (void) executedWithResult:(NSDictionary *)guessResult{
    gameResult.text = [guessResult objectForKey:@"result"];
    gameMsg.text = [guessResult objectForKey:@"msg"];
}

- (void) setGuessButtonText:(NSString *)text{
    [guessButton setTitle:text forState:UIControlStateNormal];
}

- (NSString *) getInputText{
    return guessInput.text;
}

- (void) resetUI{
    gameResult.text = @"";
    gameMsg.text = @"";
    guessInput.text = @"";
    [guessButton setTitle:@"Guess" forState:UIControlStateNormal];
}

@end