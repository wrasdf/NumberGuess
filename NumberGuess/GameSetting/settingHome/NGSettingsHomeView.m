#import "NGSettingsHomeView.h"
#import "NGSettingTableLogic.h"

@implementation NGSettingsHomeView {
    UITableView *settingList;
}

- (id)initWithDelegate:(NGSettingTableLogic *)tableLogic andFrame:(CGRect)frame {
    self = [super init];
    if (self) {
        settingList = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 320, 200) style:UITableViewStyleGrouped];
        settingList.backgroundView = nil;
        settingList.backgroundColor = [UIColor clearColor];
        self.tableLogic = tableLogic;
        settingList.delegate = self.tableLogic;
        settingList.dataSource = self.tableLogic;
        [self setFrame:frame];
        [self addSubview: settingList];
    }

    return self;
}


@end