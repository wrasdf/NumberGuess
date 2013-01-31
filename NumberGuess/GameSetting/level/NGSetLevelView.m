
#import "NGSetLevelView.h"
#import "CreateUIElement.h"


@implementation NGSetLevelView {
    UILabel *levelLabel;
    UIPickerView *levelPickerView;
    NSMutableArray *levelDataArray;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }

    return self;
}

- (void) createUIPicker{
    levelDataArray = [[NSMutableArray alloc] init];
    [levelDataArray addObject:@"Easy"];
    [levelDataArray addObject:@"Medium"];
    [levelDataArray addObject:@"Hard"];

    levelPickerView = [[UIPickerView alloc] init];
//    [levelPickerView setDataSource:self];
    [levelPickerView setDelegate:self];

    [levelPickerView setFrame:CGRectMake(10, 50, 300, 162)];
    levelPickerView.showsSelectionIndicator = YES;
    [levelPickerView selectRow:1 inComponent:0 animated:YES];
    [self addSubview:levelPickerView];
}

- (void) createLevelLabel{
    levelLabel = [[CreateUIElement alloc] createLabelWithCGRect:CGRectMake(10, 10, 300, 30) andWithTitle:@"Game Level:"];
    levelLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
}

- (void) createUI{
    [self createLevelLabel];
    [self createUIPicker];
}

-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [levelDataArray count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [levelDataArray objectAtIndex:row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %@", [levelDataArray objectAtIndex:row]);
}

@end