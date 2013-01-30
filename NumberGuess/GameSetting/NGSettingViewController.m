//
// Created by twer on 1/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import "NGSettingViewController.h"
#import "NGSettingView.h"


@implementation NGSettingViewController {

}

- (id)init {
    self = [super init];
    if (self) {
        self.title = @"Game Setting";
    }
    return self;
}

- (void)loadView {
    NGSettingView *settingView = [[NGSettingView alloc] initWithFrame:CGRectMake(0, 0, 320, [UIScreen mainScreen].bounds.size.height - 49)];
    self.view = settingView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
}




@end