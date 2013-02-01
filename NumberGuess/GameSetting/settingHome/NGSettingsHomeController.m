//
// Created by twer on 1/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSettingsHomeController.h"
#import "NGSetLevelController.h"
#import "NGSetGuessTimesController.h"

@implementation NGSettingsHomeController {

}

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Settings";
    }
    return self;
}

- (void)loadView {
    NGSettingsHomeView *settingHomeView = [[NGSettingsHomeView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49)];
    self.view = settingHomeView;
    settingHomeView.target = self;
}

- (void)changeViewToSetLevel:(id)sender {
    NGSetLevelController *controller = [[NGSetLevelController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)changeViewToSetGuessTimes:(id)sender {
    NGSetGuessTimesController *controller = [[NGSetGuessTimesController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}


@end