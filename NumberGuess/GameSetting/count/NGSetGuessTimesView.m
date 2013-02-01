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
    NSMutableArray *countDataArray;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self createUI];
    }

    return self;
}

-(void) createLabel{
    guessTimesLabel = [[CreateUIElement alloc] createLabelWithCGRect:CGRectMake(10, 10, 300, 30) andWithTitle:@"Guess Time:"];
    guessTimesLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
}

- (void) createUIPicker{
    countDataArray = [[NSMutableArray alloc] init];
    [countDataArray addObject:@"5"];
    [countDataArray addObject:@"6"];
    [countDataArray addObject:@"7"];
    [countDataArray addObject:@"8"];
    [countDataArray addObject:@"9"];
    [countDataArray addObject:@"10"];

    timesPickerView = [[UIPickerView alloc] init];
    [timesPickerView setDataSource:self];
    [timesPickerView setDelegate:self];

    [timesPickerView setFrame:CGRectMake(10, 50, 300, 162)];
    timesPickerView.showsSelectionIndicator = YES;
    [timesPickerView selectRow:1 inComponent:0 animated:YES];
    [self addSubview:timesPickerView];
}

- (void) createUI{
    [self createLabel];
    [self createUIPicker];
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [countDataArray count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [countDataArray objectAtIndex:(NSUInteger) row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %@", [countDataArray objectAtIndex:(NSUInteger) row]);
}

@end