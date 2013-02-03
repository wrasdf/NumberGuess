//
// Created by twer on 1/29/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>

@class NGGameViewController;

@interface NGGameView : UIView <UITextFieldDelegate>

@property(nonatomic, strong) NGGameViewController *delegate;

- (NSString *) getInputText;
- (void) setGuessButtonText:(NSString *)text;
- (void) executedWithResult:(NSDictionary *)guessResult;
- (void) resetUI;

@end