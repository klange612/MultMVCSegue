//
//  TypewriterMessage.m
//  MultMVCSegue
//
//  Created by Kelley Lange on 4/13/13.
//  Copyright (c) 2013 Kurt Lange. All rights reserved.
//

#import "TypewriterMessage.h"

#define DebugMode  @"TRUE"

@interface TypewriterMessage()
@property (nonatomic) int charIndex;
@property (nonatomic) float timerFrequency;
@property (weak, nonatomic) NSString *greeting;

@end

@implementation TypewriterMessage
NSTimer *timer;
SystemSoundID soundID;

@synthesize charIndex;
@synthesize timerFrequency;
@synthesize greeting;

-(id)initWithMessage:(NSString *)message
{
    greeting = message;
    [self startTyping];
}

-(void)startTyping
{
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:timerFrequency target:self selector:@selector(addCharacter:) userInfo:nil repeats:YES];
    }
    
}
/*
-(void)addCharacter:(NSTimer *)timer
{
    if (DebugMode) NSLog(@"greeting length %i", self.greeting.length);
        if (charIndex < self.greeting.length) {
            UniChar currentCharacter = [self.greeting characterAtIndex:charIndex];
            if (DebugMode)NSLog(@"currentChar = %hu", currentCharacter);
            greetingLabel.text = [greetingLabel.text stringByAppendingFormat:@"%C", currentCharacter];
            [tockSound play];
            AudioServicesPlaySystemSound (soundID);
            
            self.charIndex++;
        } else [timer invalidate];
}
*/

@end