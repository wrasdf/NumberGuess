//
// Created by twer on 2/1/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGLevelPicker.h"


@implementation NGLevelPicker {
    NSMutableArray *levelSource;
    NSUserDefaults *config;
    NSNotificationCenter *notificationCenter;
}

- (id)init {
    self = [super init];
    if (self) {
        config = [NSUserDefaults standardUserDefaults];
        notificationCenter = [NSNotificationCenter defaultCenter];
        levelSource = [[NSMutableArray alloc] init];
        [levelSource addObject:@"Easy"];
        [levelSource addObject:@"Medium"];
        [levelSource addObject:@"Hard"];
    }
    return self;
}

-(int)getSelectIndex{
    if ([[config stringForKey:@"Level"] isEqualToString:@"Easy"]){
        return 0;
    }else if([[config stringForKey:@"Level"] isEqualToString:@"Medium"]){
        return 1;
    }else{
        return 2;
    }
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
    [config setObject:[levelSource objectAtIndex:(NSUInteger) row] forKey:@"Level"];
    [config synchronize];
    [notificationCenter postNotificationName:@"NGResetGame" object:nil];
}

@end