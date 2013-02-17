#import "NGSettingsHomeView.h"
#import "CreateUIElement.h"
#import "Utility.h"


@implementation NGSettingsHomeView {
    UITableView *settingList;
}

- (id)initWithDelegate:(NGSettingTableLogic *)tableLogic andFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        settingList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 200) style:UITableViewStyleGrouped];
        settingList.backgroundView = [[UIView alloc]init];
        settingList.backgroundColor = [UIColor clearColor];
        self.tableLogic = tableLogic;
        settingList.delegate = self.tableLogic;
        settingList.dataSource = self.tableLogic;
        [self setFrame:frame];
        [self addSubview: settingList];
    }

    return self;
}

//
//- (void)createUI {
//
//
//    gameLevelButton = [[CreateUIElement alloc] createButtonWithCGRect:CGRectMake(10, 10, 300, 40) andWithTitle:@"Levels"];
//    gameLevelButton.titleLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
//    [gameLevelButton addTarget:_target action:@selector(changeViewToSetLevel:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:gameLevelButton];
//
//    gameTimesButton = [[CreateUIElement alloc] createButtonWithCGRect:CGRectMake(10, 60, 300, 40) andWithTitle:@"Guess Times"];
//    gameTimesButton.titleLabel.textAlignment = (NSTextAlignment) UITextAlignmentLeft;
//    [gameTimesButton addTarget:_target action:@selector(changeViewToSetGuessTimes:) forControlEvents:UIControlEventTouchUpInside];
//    [self addSubview:gameTimesButton];
//
//
//
//
//
//}


@end