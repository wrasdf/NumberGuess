//
// Created by twer on 1/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class NGSettingTableLogic;

@interface NGSettingsHomeView : UIView <UITextFieldDelegate>
- (id)initWithDelegate:(NGSettingTableLogic *)tableLogic andFrame:(CGRect)frame;
@property (nonatomic, strong) id tableLogic;
@end