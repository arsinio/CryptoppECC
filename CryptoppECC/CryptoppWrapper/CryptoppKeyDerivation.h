//
//  CryptoppKeyDerivation.h
//  Cryptopp-for-iOS
//
//  Created by Christopher Armenio on 6/29/16.
//
//
#import <Foundation/Foundation.h>


@interface CryptoppKeyDerivation : NSObject

+(NSData*) deriveFromSharedKey:(NSData*)sharedKeyIn
                   keyOfLength:(size_t)expectedKeyLen_bytesIn
                      withSalt:(NSData*)saltIn
                 numIterations:(unsigned int)numItIn;

@end
