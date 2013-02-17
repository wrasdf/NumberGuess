//
// Created by twer on 1/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSettingsHomeController.h"
#import "NGSetLevelController.h"
#import "NGSetGuessTimesController.h"


@implementation NGSettingsHomeController {
    NSNotificationCenter *notificationCenter;
}

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Settings";
        notificationCenter = [NSNotificationCenter defaultCenter];
    }
    return self;
}

- (void)loadView {

    NGSettingsHomeView *settingHomeView = [[NGSettingsHomeView alloc] initWithDelegate:[[NGSettingTableLogic alloc] init] andFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49)];
    self.view = settingHomeView;

    [notificationCenter addObserver:self selector:@selector(changeViewToSetLevel) name:@"NGChangeSettingViewToSetLevel" object:nil];
    [notificationCenter addObserver:self selector:@selector(changeViewToSetGuessTimes) name:@"NGChangeSettingViewToGuessTimes" object:nil];

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