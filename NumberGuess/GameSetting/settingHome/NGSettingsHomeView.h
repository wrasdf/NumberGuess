//
// Created by twer on 1/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@protocol NGSettingsHomeDelegate <NSObject>
- (void)changeViewToSetGuessTimes:(id)sender;
- (void)click:(id)sender;
@end

@interface NGSettingsHomeView : UIView <UITextFieldDelegate>
@property(nonatomic, strong) id <NGSettingsHomeDelegate> delegate;
@end