//
// Created by twer on 2/16/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSettingTableLogic.h"
#import "NGSettingHomeProtocol.h"


@implementation NGSettingTableLogic {
}

- (id)init {
    self = [super init];
    if (self) {
        self.items = [NSArray arrayWithObjects:@"Level",@"Guess Times",nil];;
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

    if([[self.items objectAtIndex:(NSUInteger) indexPath.row] isEqualToString:@"Level"]){
        [self.delegate changeViewToSetLevel];
    }else{
        [self.delegate changeViewToSetGuessTimes];
    }

}


@end