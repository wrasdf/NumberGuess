//
// Created by twer on 1/30/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSetGuessTimesView.h"
#import "CreateUIElement.h"


@implementation NGSetGuessTimesView {
    UILabel *guessTimesLabel;
    UIPickerView *timesPickerView;
    NGGuessTimesPicker *timePicker;
}

- (id) initWithPickerDelegate:(NGGuessTimesPicker *) aTimePicker andWithFrame:(CGRect) frame{
    self = [super initWithFrame:frame];
    if (self) {
        timePicker = aTimePicker;
        [self createUI];
    }

    return self;
}


-(void) createLabel{
    guessTimesLabel = [[CreateUIElement alloc] createLabelWithCGRect:CGRectMake(10, 10, 300, 30) andWithTitle:@"Guess Time:"];
    guessTimesLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
    [self addSubview:guessTimesLabel];
}

- (void) createUIPicker{
    timesPickerView = [[UIPickerView alloc] init];
    [timesPickerView setFrame:CGRectMake(10, 50, 300, 162)];
    timesPickerView.showsSelectionIndicator = YES;
    timesPickerView.delegate = timePicker;
    [timesPickerView selectRow:[timePicker getSelectIndex] inComponent:0 animated:YES];
    [self addSubview:timesPickerView];
}

- (void) createUI{
    [self createLabel];
    [self createUIPicker];
}



@end