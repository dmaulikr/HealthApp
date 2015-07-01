//
//  MedViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 29/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "MedViewController.h"

@interface MedViewController () <AVSpeechSynthesizerDelegate>
@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;

@end

@implementation MedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    
    self.title = [self.Detail objectForKey:@"nome"];
    self.tvnomec.text = [self.Detail objectForKey:@"nomec"];
    self.tvForma.text = [self.Detail objectForKey:@"formadeadm"];
    self.tvadmin.text = [self.Detail objectForKey:@"administração"];
    self.tvDose.text = [self.Detail objectForKey:@"dose"];
    self.tvAcao.text = [self.Detail objectForKey:@"acao"];
    self.tvReacao.text = [self.Detail objectForKey:@"reacao"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btLer:(id)sender {
    float rate = 0.1;
    float pitch = 1.0;
    
    
    AVSpeechSynthesisVoice *voice = [AVSpeechSynthesisVoice voiceWithLanguage:@"pt-BR"];
    AVSpeechUtterance *utterance = [[AVSpeechUtterance alloc] initWithString:@"Nome Comercial"];
    utterance.voice = voice;
    
    AVSpeechUtterance *utterance1 = [[AVSpeechUtterance alloc] initWithString:self.tvnomec.text];
    utterance1.voice = voice;
    
    AVSpeechUtterance *utterance2 = [[AVSpeechUtterance alloc] initWithString:@"Forma de Apresentação"];
    utterance2.voice = voice;
    
    AVSpeechUtterance *utterance3 = [[AVSpeechUtterance alloc] initWithString:self.tvForma.text];
    utterance3.voice = voice;
    
    AVSpeechUtterance *utterance4 = [[AVSpeechUtterance alloc] initWithString:@"Administração"];
    utterance4.voice = voice;
    
    AVSpeechUtterance *utterance5 = [[AVSpeechUtterance alloc] initWithString:self.tvadmin.text];
    utterance5.voice = voice;
    
    AVSpeechUtterance *utterance6 = [[AVSpeechUtterance alloc] initWithString:@"Dose"];
    utterance6.voice = voice;
    
    AVSpeechUtterance *utterance7 = [[AVSpeechUtterance alloc] initWithString:self.tvDose.text];
    utterance7.voice = voice;
    
    AVSpeechUtterance *utterance8 = [[AVSpeechUtterance alloc] initWithString:@"Ação"];
    utterance8.voice = voice;
    
    AVSpeechUtterance *utterance9 = [[AVSpeechUtterance alloc] initWithString:self.tvAcao.text];
    utterance9.voice = voice;
    
    AVSpeechUtterance *utterance10 = [[AVSpeechUtterance alloc] initWithString:@"Reação Adversa"];
    utterance10.voice = voice;
    
    AVSpeechUtterance *utterance11 = [[AVSpeechUtterance alloc] initWithString:self.tvReacao.text];
    utterance11.voice = voice;
    
    
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
    utterance1.rate = adjustedRate;
    utterance2.rate = adjustedRate;
    utterance3.rate = adjustedRate;
    utterance4.rate = adjustedRate;
    utterance5.rate = adjustedRate;
    utterance6.rate = adjustedRate;
    utterance7.rate = adjustedRate;
    utterance8.rate = adjustedRate;
    utterance9.rate = adjustedRate;
    utterance10.rate = adjustedRate;
    utterance11.rate = adjustedRate;
    
    float pitchMultiplier = pitch;
    if ((pitchMultiplier >= 0.5) && (pitchMultiplier <= 2.0))
    {
        utterance.pitchMultiplier = pitchMultiplier;
        utterance1.pitchMultiplier = pitchMultiplier;
        utterance2.pitchMultiplier = pitchMultiplier;
        utterance3.pitchMultiplier = pitchMultiplier;
        utterance4.pitchMultiplier = pitchMultiplier;
        utterance5.pitchMultiplier = pitchMultiplier;
        utterance6.pitchMultiplier = pitchMultiplier;
        utterance7.pitchMultiplier = pitchMultiplier;
        utterance8.pitchMultiplier = pitchMultiplier;
        utterance9.pitchMultiplier = pitchMultiplier;
        utterance10.pitchMultiplier = pitchMultiplier;
        utterance11.pitchMultiplier = pitchMultiplier;
    }
    
    [self.synthesizer speakUtterance:utterance];
    [self.synthesizer speakUtterance:utterance1];
    [self.synthesizer speakUtterance:utterance2];
    [self.synthesizer speakUtterance:utterance3];
    [self.synthesizer speakUtterance:utterance4];
    [self.synthesizer speakUtterance:utterance5];
    [self.synthesizer speakUtterance:utterance6];
    [self.synthesizer speakUtterance:utterance7];
    [self.synthesizer speakUtterance:utterance8];
    [self.synthesizer speakUtterance:utterance9];
    [self.synthesizer speakUtterance:utterance10];
    [self.synthesizer speakUtterance:utterance11];
}
@end
