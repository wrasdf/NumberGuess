//
// Created by twer on 1/30/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSetLevelController.h"
#import "NGSetLevelView.h"
#import "NGLevelPicker.h"


@implementation NGSetLevelController {
}

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Levels";
        NGLevelPicker *picker = [[NGLevelPicker alloc] init];
    }

    return self;
}


- (void)loadView {
    NGSetLevelView *setLevelView = [[NGSetLevelView alloc] initWithDelegate:[[NGLevelPicker alloc] init] andWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49 -41)];
    self.view = setLevelView;
}

@end