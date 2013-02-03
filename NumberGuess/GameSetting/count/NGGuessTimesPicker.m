//
// Created by twer on 2/3/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGGuessTimesPicker.h"
#import "NGGameViewController.h"


@implementation NGGuessTimesPicker {
    NSMutableArray *countDataArray;
    NSUserDefaults *config;
}

- (id)init {
    self = [super init];
    if (self) {
        config = [[NSUserDefaults alloc] init];
        countDataArray = [[NSMutableArray alloc] init];
        [countDataArray addObject:@"5"];
        [countDataArray addObject:@"6"];
        [countDataArray addObject:@"7"];
        [countDataArray addObject:@"8"];
        [countDataArray addObject:@"9"];
        [countDataArray addObject:@"10"];
    }

    return self;
}

-(int) getSelectIndex{
    return [config integerForKey:@"GuessTimes"] - 5 ;
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
    [config setInteger:[[countDataArray objectAtIndex:(NSUInteger) row] intValue] forKey:@"GuessTimes"];
    [config synchronize];
    [[[NGGameViewController alloc] init] resetGame:nil];
    NSLog(@"This is the guess Times in conig : ,%d",[config integerForKey:@"GuessTimes"]);
}

@end