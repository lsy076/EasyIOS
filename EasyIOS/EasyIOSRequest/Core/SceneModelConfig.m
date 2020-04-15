//
//  SceneModelConfig.m
//  ishanghome
//
//  Created by DNAKE_AY on 17/1/16.
//  Copyright © 2017年 DNAKE_AY. All rights reserved.
//

#import "SceneModelConfig.h"
#import <CommonCrypto/CommonCryptor.h>

static NSString * identifierForVendorTag = @"identifierForVendor";

@implementation SceneModelConfig

- (void)handleActionMsg:(Request *)msg
{
    
    if (msg.state == RequestStateSending) return;
        
    NSString *errorCode = msg.output[@"errorCode"];
    
    if (errorCode.intValue == 6) {
        
        [[NSNotificationCenter defaultCenter] postNotificationName:@"successLoginOut" object:nil];
        
    }
    
    if (!msg.output) return;
    
    NSLog(@"网络请求结果(%@) : %@",msg.url.absoluteString , msg.output);
    
}

-(NSString *)encrypt:(NSString *)string{
    
    NSLog(@"网络请求开始（参数）: %@", string);
    
    NSString *key = @"df1acb570370615d7ee86de73cf66c6e";
    
    NSData *plainTextData = [string dataUsingEncoding:NSUTF8StringEncoding];
    char *plainByte = (char *)[plainTextData bytes];
    
    
    NSData *md5KeyData = [key dataUsingEncoding:NSUTF8StringEncoding];
    
    //rc4
    NSData *retData = [self RC4Encrypt11:plainByte plainTextLength:plainTextData.length key:(char *)[md5KeyData bytes] akeyLength:md5KeyData.length];
    
    //    NSData *encodeBase64 = [retData base64EncodedDataWithOptions:0];
    
    NSString *str = [self convertDataToHexStr:retData];
    
    //    [result appendString:[[NSString alloc]initWithData:encodeBase64 encoding:NSUTF8StringEncoding]];
    //    retData = [self UTF8Data:retData];
    //    NSString * str  =[[NSString alloc] initWithData:retData encoding:NSUTF8StringEncoding];
    
    return str;
}
-(NSData *)RC4Encrypt11:(char *)plainText plainTextLength:(NSUInteger )ptLength
                    key:(char *)akey akeyLength:(NSUInteger)akeyLength
{
    CCCryptorRef cryptor = NULL;
    NSData* data ;//=[plainText dataUsingEncoding:NSUTF8StringEncoding];
    NSData* key; //=[akey dataUsingEncoding:NSUTF8StringEncoding];
    
    data = [NSData dataWithBytes:plainText length:ptLength];
    
    key = [NSData dataWithBytes:akey length:akeyLength];
    // 1. Create a cryptographic context.
    CCCryptorStatus status = CCCryptorCreate(kCCEncrypt, kCCAlgorithmRC4, kCCOptionPKCS7Padding, [key bytes], [key length], NULL, &cryptor );
    
    NSAssert(status == kCCSuccess, @"Failed to create a cryptographic context.");
    
    NSMutableData *retData = [NSMutableData new];
    
    // 2. Encrypt or decrypt data.
    NSMutableData *buffer = [NSMutableData data];
    [buffer setLength:CCCryptorGetOutputLength(cryptor, [data length], true)]; // We'll reuse the buffer in -finish
    
    size_t dataOutMoved;
    status = CCCryptorUpdate(cryptor, data.bytes, data.length, buffer.mutableBytes, buffer.length, &dataOutMoved);
    NSAssert(status == kCCSuccess, @"Failed to encrypt or decrypt data");
    [retData appendData:[buffer subdataWithRange:NSMakeRange(0, dataOutMoved)]];
    
    // 3. Finish the encrypt or decrypt operation.
    status = CCCryptorFinal(cryptor, buffer.mutableBytes, buffer.length, &dataOutMoved);
    NSAssert(status == kCCSuccess, @"Failed to finish the encrypt or decrypt operation");
    [retData appendData:[buffer subdataWithRange:NSMakeRange(0, dataOutMoved)]];
    CCCryptorRelease(cryptor);
    
    return retData;
}

- (NSString *)convertDataToHexStr:(NSData *)data {
    if (!data || [data length] == 0) {
        return @"";
    }
    NSMutableString *string = [[NSMutableString alloc] initWithCapacity:[data length]];
    
    [data enumerateByteRangesUsingBlock:^(const void *bytes, NSRange byteRange, BOOL *stop) {
        unsigned char *dataBytes = (unsigned char*)bytes;
        for (NSInteger i = 0; i < byteRange.length; i++) {
            NSString *hexStr = [NSString stringWithFormat:@"%x", (dataBytes[i]) & 0xff];
            if ([hexStr length] == 2) {
                [string appendString:hexStr];
            } else {
                [string appendFormat:@"0%@", hexStr];
            }
        }
    }];
    
    return string;
}

+(NSString *)deviceId
{
    static NSString * uniqueIdentifier = nil;
    if (uniqueIdentifier != nil) {
        return uniqueIdentifier;
    }
    uniqueIdentifier = [[NSUserDefaults standardUserDefaults] objectForKey:identifierForVendorTag];
    if( !uniqueIdentifier ) {
#if defined(__IPHONE_OS_VERSION_MIN_REQUIRED)
        uniqueIdentifier = [UIDevice currentDevice].identifierForVendor.UUIDString;
#endif
        [[NSUserDefaults standardUserDefaults] setObject:uniqueIdentifier forKey:identifierForVendorTag];
        [[NSUserDefaults standardUserDefaults] synchronize];
    }
    
    return uniqueIdentifier;
}

@end
