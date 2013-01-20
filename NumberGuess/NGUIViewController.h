//
//  NGUIViewController.h
//  NumberGuess
//
//  Created by twer on 1/14/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NGUIViewController : UIViewController
@property (strong, nonatomic) IBOutlet UILabel *guessMsg;
@property (strong, nonatomic) IBOutlet UILabel *guessText;
@property (strong, nonatomic) IBOutlet UILabel *resultText;
@property (strong, nonatomic) IBOutlet UILabel *gameMsg;

@end
