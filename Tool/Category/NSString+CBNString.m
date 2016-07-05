//
//  NSString+CBNString.m
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import "NSString+CBNString.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (CBNString)
+ (NSString *)getTheMD5EncryptedStringWithString:(NSString *)aString{
    const char* str = [aString UTF8String];
    unsigned char result[CC_MD5_DIGEST_LENGTH];
    CC_MD5(str, (int)strlen(str), result);
    NSMutableString *ret = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH*2];//
    for(int i = 0; i<CC_MD5_DIGEST_LENGTH; i++) {
        [ret appendFormat:@"%02x",result[i]];
    }
    return ret;
}
+ (float)heightForStringFontSize:(float)fontSize
{
    CGSize sizeToFit = [@"我" sizeWithFont:[UIFont systemFontOfSize:fontSize] constrainedToSize:CGSizeMake(100, CGFLOAT_MAX) lineBreakMode:UILineBreakModeCharacterWrap];
    return sizeToFit.height;
}

@end
