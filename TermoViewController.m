//
//  TermoViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 15/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "TermoViewController.h"


@interface TermoViewController ()

@end

@implementation TermoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    
    self.lbTermo.text = self.Detail.nomeTermo;
    self.txSignificado.text = self.Detail.sigTermo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)btOuvir:(id)sender {
    Sound *sound = [Sound new];
    [sound parameter01:self.lbTermo.text parameter02:self.txSignificado.text parameter03:self.synthesizer];
}
@end
