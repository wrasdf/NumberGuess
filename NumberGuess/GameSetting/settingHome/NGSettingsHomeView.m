#import "NGSettingsHomeView.h"
#import "CreateUIElement.h"

@implementation NGSettingsHomeView {
    UIButton *gameTimesButton;
    UIButton *gameLevelButton;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {

    gameLevelButton = [[CreateUIElement alloc] createButtonWithCGRect:CGRectMake(10, 10, 300, 40) andWithTitle:@"Levels"];
    gameLevelButton.titleLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
    [gameLevelButton addTarget:_target action:@selector(changeViewToSetLevel:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:gameLevelButton];

    gameTimesButton = [[CreateUIElement alloc] createButtonWithCGRect:CGRectMake(10, 60, 300, 40) andWithTitle:@"Guess Times"];
    gameTimesButton.titleLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
    [gameTimesButton addTarget:_target action:@selector(changeViewToSetGuessTimes:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:gameTimesButton];

}

@end