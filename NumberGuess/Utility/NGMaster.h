//
// Created by twer on 1/24/13.
//
// To change the template use AppCode | Preferences | File Templates.
//


#import <Foundation/Foundation.h>


@interface NGMaster : NSObject

- (id) initWithMaxCount:(int) count andWithGameLevel:(NSString *) level andTargetNumbers:(NSArray *) targetArray;

- (BOOL) isExceeded;
- (void) resetGame;

- (NSDictionary *) guessWithNumbers:(NSArray *) numbers;

@end