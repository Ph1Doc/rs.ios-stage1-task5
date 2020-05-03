#import "Converter.h"

// Do not change
NSString *KeyPhoneNumber = @"phoneNumber";
NSString *KeyCountry = @"country";

@implementation PNConverter
- (NSDictionary*)converToPhoneNumberNextString:(NSString*)string; {
    // good luck

    NSMutableDictionary *countries = [[NSMutableDictionary alloc] initWithDictionary:@{@"7": @[@"RU", @10],
                  @"373": @[@"MD", @8],
                  @"374": @[@"AM", @8],
                  @"375": @[@"BY", @9],
                  @"380": @[@"UA", @9],
                  @"992": @[@"TJ", @9],
                  @"993": @[@"TM", @8],
                  @"994": @[@"AZ", @9],
                  @"996": @[@"KG", @9],
                  @"998": @[@"UZ", @9]
    }];

    for (int i = 0; i <= [string length]; i++ ) {

        NSString *number = [[NSString alloc] initWithString:[string substringWithRange:NSMakeRange(0, i)]];

            if (countries[number] != nil) {
                if ([number isEqual:@"7"] && [string length] >= i+1) {
                    if ([[string substringWithRange:NSMakeRange(0, i + 1)] isEqual:@"77"]) {
                        [countries setObject:@[@"KZ", @10] forKey:@"7"];
                    }
                }

                int code = 3;
                NSArray* countryInfo = [countries valueForKey:number];
                int countNumbers = [countryInfo[1] intValue];
                if (countNumbers == 8) {
                    code = 2;
                    NSMutableString *phoneNumber = [NSMutableString stringWithFormat:@"+"];
                    for (int j = 0; j < [string length]; j++) {
                        if (j == 3 + code + i) {
                            [phoneNumber appendString:@"-"];
                        }
                        if (j == i) {
                            [phoneNumber appendString:@" ("];
                        }
                        if (j == i + code) {
                            [phoneNumber appendString:@") "];
                        }
                        if (j < countNumbers + i) {
                            [phoneNumber appendString:[NSMutableString stringWithFormat:@"%@",
                                                       [string substringWithRange:NSMakeRange(j, 1)]]];
                        }
                    }
                    NSDictionary *resultDict = @{KeyPhoneNumber: phoneNumber,
                                                 KeyCountry: countries[number][0]};
                    return resultDict;
                } else if (countNumbers == 9) {
                    code = 2;
                    NSMutableString *phoneNumber = [NSMutableString stringWithFormat:@"+"];
                    for (int j = 0; j < [string length]; j++) {
                        if ((j == 3 + code + i) || (j == 5 + code + i)) {
                            [phoneNumber appendString:@"-"];
                        }
                        if (j == i) {
                            [phoneNumber appendString:@" ("];
                        }
                        if (j == i + code) {
                            [phoneNumber appendString:@") "];
                        }
                        if (j < countNumbers + i) {
                            [phoneNumber appendString:[NSMutableString stringWithFormat:@"%@",
                                                       [string substringWithRange:NSMakeRange(j, 1)]]];
                        }
                    }
                    NSDictionary *resultDict = @{KeyPhoneNumber: phoneNumber,
                                                 KeyCountry: countries[number][0]};
                    return resultDict;

                } else if (countNumbers == 10) {
                    code = 3;
                    NSMutableString *phoneNumber = [NSMutableString stringWithFormat:@"+"];
                    for (int j = 0; j < [string length]; j++) {
                        if ((j == 3 + code + i) || (j == 5 + code + i)) {
                            [phoneNumber appendString:@"-"];
                        }
                        if (j == i) {
                            [phoneNumber appendString:@" ("];
                        }
                        if (j == i + code) {
                            [phoneNumber appendString:@") "];
                        }
                        if (j < countNumbers + i) {
                            [phoneNumber appendString:[NSMutableString stringWithFormat:@"%@",
                                                       [string substringWithRange:NSMakeRange(j, 1)]]];
                        }
                    }
                    NSDictionary *resultDict = @{KeyPhoneNumber: phoneNumber,
                                                 KeyCountry: countries[number][0]};
                    return resultDict;
                }
            }
    }

    if ([[string substringWithRange:NSMakeRange(0, 1)] isEqual:@"+"]) {
        return @{KeyPhoneNumber: [NSString stringWithFormat:@"%@", [string substringWithRange:NSMakeRange(0, MIN(13, [string length]))]],
        KeyCountry: @""};
    }
    return @{KeyPhoneNumber: [NSString stringWithFormat:@"+%@", [string substringWithRange:NSMakeRange(0, MIN(12, [string length]))]],
             KeyCountry: @""};
}
@end
