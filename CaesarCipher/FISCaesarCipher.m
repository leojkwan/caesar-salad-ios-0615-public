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
    
        NSMutableString *encodedString = [[NSMutableString alloc] init]; // needs to be outside for loop to store the entire word
        
    
                                             
        for (NSInteger i = 0; i < message.length; i++){
            
            
            
            NSInteger letterInMessage = [message characterAtIndex:i]; // THIS IS THE ACSII VERSION OF WORD CHARACTER
            
            BOOL isPunctuation = (letterInMessage > 32 && letterInMessage < 48 ) ||
            (letterInMessage > 57 && letterInMessage < 66 ) ||
            (letterInMessage > 91 && letterInMessage < 97 );
            
            NSInteger letterInMessageEncrypted;  // add the offset to convert to ASCII
            
            
            //                                  //
            // THIS TAKES CARE OF SPACES //
            if ([[NSString stringWithFormat:@"%c", [message characterAtIndex:i]] isEqualToString:@" "]){
               
                [encodedString appendFormat:@" "]; // takes care of each space in a word
                
            }
            //                                  //
            // THIS TAKES CARE OF PUNCTUATIONS //
          else if (isPunctuation) {
            
          
              [encodedString appendFormat:@"%@", [NSString stringWithFormat:@"%c", letterInMessage]];

              
          }
            
            //                                  //
            // THIS TAKES CARE OF UPPER AND LOWER CASES //
            else { // takes care of upper and lower case letters
                
                    offset = offset%26;
                
                    letterInMessageEncrypted = letterInMessage + offset;
                
                

                    if (letterInMessageEncrypted > 122){ // letters are 97-122
                    letterInMessageEncrypted -= 26;
                    }
                    if (letterInMessageEncrypted > 90 && letterInMessageEncrypted < 97) { // CAP letters are 65-90
                        letterInMessageEncrypted -= 26;
                    }
                
                letterInMessage = letterInMessageEncrypted;
                
                 [encodedString appendFormat:@"%@", [NSString stringWithFormat:@"%c", letterInMessageEncrypted]];
            
        }
       


    }
    
    
    return encodedString;
}


-(NSString *) decodeWithMessage:(NSString *)encodedMessage andOffset:(NSInteger)offset {
    
    
    
    if (offset%26 == 0) {
        return encodedMessage;
    }
    
    NSMutableString *encodedString = [[NSMutableString alloc] init]; // needs to be outside for loop to store the entire word
    
    
    
    for (NSInteger i = 0; i < encodedMessage.length; i++){
        
        
        
        NSInteger letterInMessage = [encodedMessage characterAtIndex:i]; // THIS IS THE ACSII VERSION OF WORD CHARACTER
        
        BOOL isPunctuation = (letterInMessage > 32 && letterInMessage < 48 ) ||
        (letterInMessage > 57 && letterInMessage < 66 ) ||
        (letterInMessage > 91 && letterInMessage < 97 );
        
        NSInteger letterInMessageEncrypted;  // add the offset to convert to ASCII
        
        
        //                                  //
        // THIS TAKES CARE OF SPACES //
        if ([[NSString stringWithFormat:@"%c", [encodedMessage characterAtIndex:i]] isEqualToString:@" "]){
            
            [encodedString appendFormat:@" "]; // takes care of each space in a word
            
        }
        //                                  //
        // THIS TAKES CARE OF PUNCTUATIONS //
        else if (isPunctuation) {
            
            
            [encodedString appendFormat:@"%@", [NSString stringWithFormat:@"%c", letterInMessage]];
            
            
        }
        
        //                                  //
        // THIS TAKES CARE OF UPPER AND LOWER CASES //
        else { // takes care of upper and lower case letters
            
            offset = offset%26;
            
            letterInMessageEncrypted = letterInMessage - offset;
            
            
            
            if (letterInMessageEncrypted > 122){ // letters are 97-122
                letterInMessageEncrypted += 26;
                
            }
            if ((letterInMessageEncrypted < 65) || (letterInMessageEncrypted < 97)) { // CAP letters are 65-90
                letterInMessageEncrypted += 26;
            }
            
            letterInMessage = letterInMessageEncrypted;
            
            [encodedString appendFormat:@"%@", [NSString stringWithFormat:@"%c", letterInMessageEncrypted]];
            
        }
        
        
        
    }
    
    
    return encodedString;
}



@end
