//
//  NSString+Crypto.m
//  JACStock
//
//  Created by Admin on 2018/8/24.
//  Copyright © 2018年 Tima. All rights reserved.
//

#import "NSString+Crypto.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Crypto)

- (NSString *)MD5PwdEncryption
{
    const char *cStr = [self UTF8String];
    unsigned char digest[CC_MD5_DIGEST_LENGTH];
    CC_MD5( cStr, (int)strlen(cStr), digest );
    
    NSMutableString *output = [NSMutableString stringWithCapacity:CC_MD5_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_MD5_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }
    
    return [output uppercaseString];
//    return output;
}

@end
