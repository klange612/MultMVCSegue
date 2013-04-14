//
//  WillVC.m
//  MultMVCSegue
//
//  Created by Kelley Lange on 4/13/13.
//  Copyright (c) 2013 Kurt Lange. All rights reserved.
//

#import "WillVC.h"

#define DebugMode   @"TRUE"

@interface WillVC ()
@property (weak, nonatomic) NSString *greeting;
@property (nonatomic) int charIndex;
@property (nonatomic) float timerFrequency;
@end

@implementation WillVC
NSTimer *timer;
SystemSoundID soundID;

@synthesize greeting = _greeting;
@synthesize charIndex;
@synthesize greetingLabel;
@synthesize timerFrequency;

-(void)setup
{
    charIndex = 0;
    [timer invalidate];
    timer = nil;
    NSString *soundPath = [[NSBundle mainBundle] pathForResource:@"Tink" ofType:@"aiff"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)[NSURL fileURLWithPath: soundPath], &soundID);
    
    
    if (!charIndex) charIndex = 0;
    timerFrequency = 0.3;
    if (self.greeting == nil) {
        self.greeting = @"Hello, Will";
    }
    [self startTyping];
}

-(void)startTyping
{
    if (timer == nil) {
        timer = [NSTimer scheduledTimerWithTimeInterval:timerFrequency target:self selector:@selector(addCharacter:) userInfo:nil repeats:YES];
        NSLog(@"does this run between chars");
    }
    
}

-(void)addCharacter:(NSTimer *)timer
{
    if (DebugMode) NSLog(@"greeting length %i", self.greeting.length);
    if (charIndex < self.greeting.length) {
        UniChar currentCharacter = [self.greeting characterAtIndex:charIndex];
        if (DebugMode)NSLog(@"currentChar = %hu", currentCharacter);
        greetingLabel.text = [greetingLabel.text stringByAppendingFormat:@"%C", currentCharacter];
            AudioServicesPlaySystemSound (soundID);
        
        self.charIndex++;
    } else [timer invalidate];
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setup];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
