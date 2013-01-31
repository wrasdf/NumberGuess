#import "NGSettingsHomeView.h"
#import "CreateUIElement.h"

@implementation NGSettingsHomeView {
    UIButton *gameTimesButton;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {

    _gameLevelButton = [[CreateUIElement alloc] createButtonWithCGRect:CGRectMake(10, 10, 300, 40) andWithTitle:@"Set Game Level"];
    _gameLevelButton.titleLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
//    [gameLevelButton addTarget:_delegate action:@selector(guess:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:_gameLevelButton];

    gameTimesButton = [[CreateUIElement alloc] createButtonWithCGRect:CGRectMake(10, 60, 300, 40) andWithTitle:@"Set Guess Times"];
    gameTimesButton.titleLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
//    [gameTimesButton addTarget:_delegate action:@selector(guess:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:gameTimesButton];

}

@end