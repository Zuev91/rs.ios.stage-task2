#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    if (array == nil || array.count == 0 || ![array[0] isKindOfClass:NSArray.class]){
            return @[];
        }
        
        NSMutableArray<NSNumber*> *numbers = [[NSMutableArray alloc] init];
        NSMutableArray<NSString*> *rename = [[NSMutableArray alloc] init];

        for (NSArray *inArray in array) {
            for (id element in inArray) {
                if ([element isKindOfClass:NSNumber.class]) {
                    [numbers addObject:element];
                } else {
                    [rename addObject:element];
                }
            }
        }
        if (rename.count == 0) {
            [numbers sortUsingDescriptors:
             [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
            return numbers;
        } else if (numbers.count == 0) {
            [rename sortUsingSelector:@selector(localizedCaseInsensitiveCompare:)];
            return rename;
        }
        [numbers sortUsingDescriptors:
         [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES]]];
        
        [rename sortUsingDescriptors:
         [NSArray arrayWithObject:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO selector:@selector(localizedCaseInsensitiveCompare:)]]];
        return [NSArray arrayWithObjects:numbers, rename, nil];
    }

@end
