//
//  FISCaesarCipher.m
//  CaesarCipher
//
//  Created by Chris Gonzales on 5/29/14.
//  Copyright (c) 2014 FIS. All rights reserved.
//

#import "FISCaesarCipher.h"

@implementation FISCaesarCipher

//define methods here
-(NSString *) encodeWithMessage:(NSString *)message andOffset:(NSInteger)offset {
    
    if (offset%26 == 0) {
        return message;
    }
    
    NSMutableString *encodedString = [[NSMutableString alloc] init];
    
    for (NSInteger i = 0; i < message.length; i++){
        if ([[NSString stringWithFormat:@"%c", [message characterAtIndex:i]] isEqualToString:@" "]){
           [encodedString appendFormat:@" "];
        } else {
            NSInteger messageCode = [message characterAtIndex:i]; // 44
            NSInteger messageCodeEncrypted = messageCode + offset;
            
            if (messageCodeEncrypted > 90 && messageCodeEncrypted < 97){ // CAP letters are 65-90
                messageCodeEncrypted -= 26;
            }
            if (messageCodeEncrypted > 122){ // letters are 97-122
                messageCodeEncrypted -= 26;
            }
            
            [encodedString appendFormat:@"%c", messageCodeEncrypted];
        }
       


    }
    
    
    return encodedString;
}


-(NSString *) decodeWithMessage:(NSString *)encodedMessage andOffset:(NSInteger)offset {

    return nil;
}



@end
