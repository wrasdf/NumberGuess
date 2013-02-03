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
        if ([tempArr containsObject:[NSString stringWithFormat:@"%d",randomNumber]]){
            [self insertNonDuplicatedNumber];
        }else{
            [tempArr addObject: [NSString stringWithFormat:@"%d",randomNumber]];
        }
    }
}

- (NSArray *)createWithLevel:(NSString *)level{
    [tempArr removeAllObjects];
    if ([level isEqualToString:@"Hard"]){
        for (int i=0; i<4; i++){
            [tempArr addObject:[NSString stringWithFormat:@"%d",[self getRandomNumber:0 to:9]]];
        }
    }else{
        for (int i=0; i<4; i++){
            [self insertNonDuplicatedNumber];
        }
    }
    NSLog(@"in the random number: %@",tempArr);
    return tempArr;
}

@end
