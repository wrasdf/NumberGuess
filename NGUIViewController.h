//
//  NGUIViewController.h
//  NumberGuess
//
//  Created by twer on 1/14/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGUIViewController : UIViewController <UITextFieldDelegate>
@property (strong, nonatomic) IBOutlet UITextField *guessInput;
@property (strong, nonatomic) IBOutlet UIButton *guessAction;
@property (strong, nonatomic) IBOutlet UILabel *resultText;
@property (strong, nonatomic) IBOutlet UILabel *gameTitle;

- (IBAction)guess:(id)sender;

@end
