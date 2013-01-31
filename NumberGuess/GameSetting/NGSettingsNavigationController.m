
#import "NGSettingsNavigationController.h"
#import "NGSetGuessTimesController.h"
#import "NGSettingsHomeController.h"
#import "NGSetLevelController.h"


@implementation NGSettingsNavigationController {
    NGSettingsHomeController *homeController;
//    NGSetLevelController *levelController;
//    NGSetGuessTimesController *guessTimesController;
}

- (id)init {
    homeController = [[NGSettingsHomeController alloc] init];
    self = [super initWithRootViewController:homeController];
    if (self) {
        self.tabBarItem.title = @"Game Settings";
//        levelController = [[NGSetLevelController alloc] init];
//        guessTimesController = [[NGSetGuessTimesController alloc] init];
//        [self setViewControllers:[NSArray arrayWithObject:homeController] animated:NO];
//        [self popViewControllerByIndex:0];
    }

    return self;
}


@end