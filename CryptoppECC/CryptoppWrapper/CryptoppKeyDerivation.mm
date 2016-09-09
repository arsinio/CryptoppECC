//
//  CryptoppKeyDerivation.m
//  Cryptopp-for-iOS
//
//  Created by Christopher Armenio on 6/29/16.
//
//
#import "CryptoppKeyDerivation.h"


#include "pwdbased.h"
#include "md5.h"


@implementation CryptoppKeyDerivation

+(NSData*) deriveFromSharedKey:(NSData*)sharedKeyIn
                   keyOfLength:(size_t)expectedKeyLen_bytesIn
                      withSalt:(NSData*)saltIn
                 numIterations:(unsigned int)numItIn
{
    CryptoPP::PKCS5_PBKDF2_HMAC<CryptoPP::Weak1::MD5> *deriv = new CryptoPP::PKCS5_PBKDF2_HMAC<CryptoPP::Weak1::MD5>();

    NSMutableData* retVal = [NSMutableData dataWithLength:expectedKeyLen_bytesIn];

    deriv->DeriveKey((byte*)retVal.mutableBytes, retVal.length, 0, (const byte*)sharedKeyIn.bytes, sharedKeyIn.length, (const byte*)saltIn.bytes, saltIn.length, numItIn);

    return retVal;
}


@end
