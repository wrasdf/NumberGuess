
#import "NGSetLevelView.h"
#import "CreateUIElement.h"
#import "NGLevelPicker.h"


@implementation NGSetLevelView {
    UILabel *levelLabel;
    NGLevelPicker *pickerLogic;
    UIPickerView *levelPicker;
}

- (id)initWithDelegate:(NGLevelPicker *) delegatePicker andWithFrame:(CGRect) rect{
    self = [super init];
    if (self) {
        pickerLogic = delegatePicker;
        [self setFrame:rect];
        [self createUI];
    }

    return self;
}

- (void) createUIPicker{
    levelPicker = [[UIPickerView alloc] init];
    [levelPicker setFrame:CGRectMake(10, 50, 300, 162)];
    levelPicker.showsSelectionIndicator = YES;
    levelPicker.delegate = pickerLogic;
    [levelPicker selectRow:[pickerLogic getSelectIndex] inComponent:0 animated:YES];
    [self addSubview:levelPicker];
}


- (void) createLevelLabel{
    levelLabel = [[CreateUIElement alloc] createLabelWithCGRect:CGRectMake(10, 10, 300, 30) andWithTitle:@"Game Level:"];
    levelLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
    [self addSubview:levelLabel];
}

- (void) createUI{
    [self createLevelLabel];
    [self createUIPicker];
}


@end