//
//  NGGuess.h
//  NumberGuess
//
//  Created by twer on 1/11/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface
NGGuess : NSObject

- (id)initWithRandomNumber;
- (id)initWithTargetNumber:(NSArray *)aTargetNumber;
- (NSString *) compareGuessNumber:(NSArray *) guess;
- (int) getGuessTime;
- (NSString *) getGameMsg;
- (BOOL) keepGuess;
- (BOOL) isFinished;
- (void) reStartGuessGame;
@end

