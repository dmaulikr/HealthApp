//
//  Speak.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 26/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "Sound.h"

@interface Sound () <AVSpeechSynthesizerDelegate>

@end

@implementation Sound

- (void)parameter01:(NSString *)text01 parameter02:(NSString *)text02 parameter03:(AVSpeechSynthesizer *)synthesizer;
{
    float rate = 0.1;
    float pitch = 1.0;
    
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    
    AVSpeechUtterance *utterance01 = [[AVSpeechUtterance alloc] initWithString:text01];
    utterance01.voice = voice;
    
    AVSpeechUtterance *utterance02 = [[AVSpeechUtterance alloc] initWithString:text02];
    utterance02.voice = voice;
    
    float adjustedRate = AVSpeechUtteranceDefaultSpeechRate * rate;
    
    if (adjustedRate > AVSpeechUtteranceMaximumSpeechRate)
    {
        adjustedRate = AVSpeechUtteranceMaximumSpeechRate;
    }
    
    if (adjustedRate < AVSpeechUtteranceMinimumSpeechRate)
    {
        adjustedRate = AVSpeechUtteranceMinimumSpeechRate;
    }
    
    utterance01.rate = adjustedRate;
    utterance02.rate = adjustedRate;
    
    float pitchMultiplier = pitch;
    if ((pitchMultiplier >= 0.5) && (pitchMultiplier <= 2.0))
    {
        utterance01.pitchMultiplier = pitchMultiplier;
        utterance02.pitchMultiplier = pitchMultiplier;
    }
    [synthesizer speakUtterance:utterance01];
    [synthesizer speakUtterance:utterance02];
}

@end
