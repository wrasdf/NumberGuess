//
// Created by twer on 1/30/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSetLevelController.h"
#import "NGSetLevelView.h"


@implementation NGSetLevelController {
}

- (id)init {
    self = [super init];
    if (self) {

    }

    return self;
}


- (void)loadView {
    NGSetLevelView *setLevelView = [[NGSetLevelView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49)];
    self.view = setLevelView;

}

@end