#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    
    __block NSString *result = nil;
    if (numbersArray == nil || numbersArray.count == 0) {
        result = @"";
        return result;
       }
    if ([numbersArray count] > 4){
        result = false;
        return result;
        }
    
    NSMutableArray *array = [[NSMutableArray alloc] initWithCapacity:4];
    for (int i = 0; i < 4; i++) {
        array[i] = @0;
    }
    [numbersArray enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([(NSNumber *)obj intValue] < 0) {
            result = @"Negative numbers are not valid for input.";
            *stop = 1;
        }
        else if ([(NSNumber *)obj intValue] > 255) {
            result = @"The numbers in the input array can be in the range from 0 to 255.";
            *stop = 1;
        }
        else array[idx] = obj;
    }];
    if (result) {
        return result;
        }
    else {
        result = [array componentsJoinedByString:@"."];
        return result;
    }
}

@end
