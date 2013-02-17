//
// Created by twer on 1/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSettingsHomeController.h"
#import "NGSetLevelController.h"
#import "NGSetGuessTimesController.h"
#import "NGSettingsHomeView.h"
#import "NGSettingTableLogic.h"


@implementation NGSettingsHomeController {
    NGSettingTableLogic *tableLogic;
}

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Settings";
        tableLogic = [[NGSettingTableLogic alloc] init];
    }
    return self;
}

- (void)loadView {

    NGSettingsHomeView *settingHomeView = [[NGSettingsHomeView alloc] initWithDelegate:tableLogic andFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49)];
    self.view = settingHomeView;
    tableLogic.delegate = self;

}


- (void)changeViewToSetLevel {
    NGSetLevelController *controller = [[NGSetLevelController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}

- (void)changeViewToSetGuessTimes {
    NGSetGuessTimesController *controller = [[NGSetGuessTimesController alloc] init];
    [self.navigationController pushViewController:controller animated:YES];
}


- (void)viewDidLoad {
    [super viewDidLoad];
}


@end