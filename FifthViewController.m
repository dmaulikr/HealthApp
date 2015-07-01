//
//  FifthViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 30/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "FifthViewController.h"
#import "FourthTableViewController.h"

@interface FifthViewController ()<AVSpeechSynthesizerDelegate>

@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;


@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    
    self.lbSig.text = [self.Detail objectForKey:@"nome"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)btLer:(id)sender {
    float rate = 0.1;
    float pitch = 1.0;
    
    
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:self.lbSig.text];
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
    utterance.rate = adjustedRate;
    
    float pitchMultiplier = pitch;
    if ((pitchMultiplier >= 0.5) && (pitchMultiplier <= 2.0))
    {
        utterance.pitchMultiplier = pitchMultiplier;
    }

    [self.synthesizer speakUtterance:utterance];
}

@end
