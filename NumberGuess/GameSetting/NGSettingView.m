#import "NGSettingView.h"
#import "CreateUIElement.h"

@implementation NGSettingView {
    UILabel *setGameLevelLabel;
    UILabel *setGameCountLabel;
    UITextField *guessTimes;
    UIButton *saveBtn;
    UIPickerView *pickerView;
    NSMutableArray *dataArray;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    [guessTimes resignFirstResponder];
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField __unused {
    [textField resignFirstResponder];
    return YES;
}

- (void) createUI {
    setGameLevelLabel = [[CreateUIElement alloc] createLabelWithCGRect:CGRectMake(10, 10, 300, 30) andWithTitle:@"Set game level:"];
    setGameLevelLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
    [self addSubview:setGameLevelLabel];

    dataArray = [[NSMutableArray alloc] init];
    [dataArray addObject:@"Easy"];
    [dataArray addObject:@"Medium"];
    [dataArray addObject:@"Hard"];

    pickerView = [[UIPickerView alloc] init];
    [pickerView setDataSource:self];
    [pickerView setDelegate:self];

    [pickerView setFrame:CGRectMake(10, 50, 300, 162)];
    pickerView.showsSelectionIndicator = YES;
    [pickerView selectRow:1 inComponent:0 animated:YES];
    [self addSubview:pickerView];

    setGameCountLabel = [[CreateUIElement alloc] createLabelWithCGRect:CGRectMake(10, 240, 300, 30) andWithTitle:@"Set game Count:"];
    setGameCountLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
    [self addSubview:setGameCountLabel];

    guessTimes = [[CreateUIElement alloc] createTextFieldWithCGRect:CGRectMake(10, 280, 300, 30)];
    guessTimes.delegate = self;
    [self addSubview:guessTimes];

    saveBtn = [[CreateUIElement alloc] createButtonWithCGRect:CGRectMake(10, 340, 300, 30) andWithTitle:@"Save"];
    [self addSubview:saveBtn];

}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [dataArray count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [dataArray objectAtIndex: row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %@", [dataArray objectAtIndex: row]);
}

@end