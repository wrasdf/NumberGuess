//
// Created by twer on 2/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSettingTableLogic.h"


@implementation NGSettingTableLogic {
    NSNotificationCenter *notificationCenter;
}

- (id)init {
    self = [super init];
    if (self) {
        notificationCenter = [NSNotificationCenter defaultCenter];
        self.items = [[NSArray alloc] initWithObjects:@"Levels",@"Guess Times", nil];
    }

    return self;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [self.items count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    // Identifier for retrieving reusable cells. static NSString
    NSString *cellIdentifier = @"MyCellIdentifier"; // Attempt to request the reusable cell.

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                      reuseIdentifier:cellIdentifier];
    }
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.items objectAtIndex:(NSUInteger) indexPath.row];

    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    // Show an alert with the index selected.

    if([[self.items objectAtIndex:(NSUInteger) indexPath.row] isEqualToString:@"Levels"]){
        [notificationCenter postNotificationName:@"NGChangeSettingViewToSetLevel" object:nil];
    }else{
        [notificationCenter postNotificationName:@"NGChangeSettingViewToGuessTimes" object:nil];
    }

}


@end