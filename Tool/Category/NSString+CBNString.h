//
//  NSString+CBNString.h
//  CBNWeeklyMagazine
//
//  Created by huaxianwei on 16/6/27.
//  Copyright © 2016年 上海第一财经报业有限公司. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (CBNString)
+ (NSString *)getTheMD5EncryptedStringWithString:(NSString *)aString;
+ (float)heightForStringFontSize:(float)fontSize;
@end
