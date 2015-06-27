//
//  Speak.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 26/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "Speak.h"

@interface Speak () <AVSpeechSynthesizerDelegate>

@end

@implementation Speak

- (void)speak01:(NSString *)top test:(AVSpeechSynthesizer *)synthesizer
{
    float rate = 0.1;
    float pitch = 1.0;
    
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    //AVSpeechUtterance *utterance1 = [[AVSpeechUtterance alloc] initWithString:(id)sender];
    //utterance1.voice = voice;
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:top];
    utterance.voice = voice;
    
    float adjustedRate = AVSpeechUtteranceDefaultSpeechRate * rate;
    
    if (adjustedRate > AVSpeechUtteranceMaximumSpeechRate)
    {
        adjustedRate = AVSpeechUtteranceMaximumSpeechRate;
    }
    
    if (adjustedRate < AVSpeechUtteranceMinimumSpeechRate)
    {
        adjustedRate = AVSpeechUtteranceMinimumSpeechRate;
    }
    //utterance1.rate = adjustedRate;
    utterance.rate = adjustedRate;
    
    float pitchMultiplier = pitch;
    if ((pitchMultiplier >= 0.5) && (pitchMultiplier <= 2.0))
    {
        utterance.pitchMultiplier = pitchMultiplier;
    }
    
    
    //[self.synthesizer speakUtterance:utterance1];
    [synthesizer speakUtterance:utterance];
    
}



@end
