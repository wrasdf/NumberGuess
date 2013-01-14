//
//  RandomNumber.m
//  NumberGuess
//
//  Created by twer on 1/14/13.
//  Copyright (c) 2013 twer. All rights reserved.
//

#import "RandomNumber.h"

@implementation RandomNumber{
    NSMutableArray *tempArr;
}

- (id) init{
    self = [super init];
    if (self) {
        tempArr = [[NSMutableArray alloc] init];
    }
    return self;
}

- (int) getRandomNumber:(int)from to:(int)to{
    return from + arc4random() % (to-from+1);
}

- (void) insertNonDuplicatedNumber {
    if (tempArr.count < 4){
        int randomNumber = [self getRandomNumber:0 to:9];
        if ([tempArr containsObject:[NSNumber numberWithInt:randomNumber]]){
            [self insertNonDuplicatedNumber];
        }else{
            [tempArr addObject: [NSNumber numberWithInt:randomNumber]];
        }
    }
}

- (NSArray *) create {
    [tempArr removeAllObjects];
    for (int i=0; i<4; i++){
        [self insertNonDuplicatedNumber];
    }
    return tempArr;
}

@end
