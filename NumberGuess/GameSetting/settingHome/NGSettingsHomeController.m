//
// Created by twer on 1/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSettingsHomeController.h"
#import "NGSettingsHomeView.h"

@implementation NGSettingsHomeController {

}

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Game Setting";
    }
    return self;
}

- (void)loadView {

    NGSettingsHomeView *settingHomeView = [[NGSettingsHomeView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49)];
    self.view = settingHomeView;

//    [settingHomeView.button addTarget: ]

//    levelController = [[NGSetLevelController alloc] init]
//    [self.navigationController pushViewController:levelController animated:YES];

}

- (void)viewDidLoad {
    [super viewDidLoad];
}




@end