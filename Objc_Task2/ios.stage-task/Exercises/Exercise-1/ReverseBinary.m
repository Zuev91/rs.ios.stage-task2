#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    UInt8 m = 0;
    int i = 128;
    while (i >= 1) {
        if (n % 2 != 0)
            m += i;
        n/=2;
        i/=2;
    }
    return m;
}
