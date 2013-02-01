//
// Created by twer on 2/1/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGLevelPicker.h"


@implementation NGLevelPicker {
    NSMutableArray *levelSource;
//    UIPickerView *levelPickerContent;
}

- (id)init {
    self = [super init];
    if (self) {
        levelSource = [[NSMutableArray alloc] init];
        [levelSource addObject:@"Easy"];
        [levelSource addObject:@"Medium"];
        [levelSource addObject:@"Hard"];
//        [levelPickerContent setDataSource:self];
//        [levelPickerContent setDelegate:self];
    }
    return self;
}


-(NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

// Total rows in our component.
-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{
    return [levelSource count];
}

// Display each row's data.
-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return [levelSource objectAtIndex:(NSUInteger) row];
}

// Do something with the selected row.
-(void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    NSLog(@"You selected this: %@", [levelSource objectAtIndex:(NSUInteger) row]);
}



@end