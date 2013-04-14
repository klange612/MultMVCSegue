//
//  TypewriterMessage.h
//  MultMVCSegue
//
//  Created by Kelley Lange on 4/13/13.
//  Copyright (c) 2013 Kurt Lange. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AudioToolbox/AudioToolbox.h>

@interface TypewriterMessage : NSObject

-(id)initWithMessage:(NSString *)message;

-(void)startTyping;

@end
