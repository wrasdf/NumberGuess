//
// Created by twer on 1/30/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSetGuessTimesController.h"
#import "NGSetGuessTimesView.h"


@implementation NGSetGuessTimesController {

}
- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Guess Times";
    }

    return self;
}


- (void)loadView {
    NGSetGuessTimesView *guessTimesView = [[NGSetGuessTimesView alloc] initWithPickerDelegate:[[NGGuessTimesPicker alloc] init] andWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49)];
    self.view = guessTimesView;
}

@end