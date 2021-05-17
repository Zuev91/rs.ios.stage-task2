#import "Pairs.h"

@implementation Pairs

- (NSInteger)countPairs:(NSArray <NSNumber *> *)array number:(NSNumber *)number {
    
    NSUInteger result = 0;
    NSUInteger cnt = [array count];
    
    for (int i = 0; i<cnt; i++) {
        for (int j = i+1; j < cnt; j++) {
            if (abs(array[i].intValue - array[j].intValue) == number.intValue)
                result++;
                }
    }
    
    return result;
}

@end
