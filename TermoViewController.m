//
//  TermoViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 15/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "TermoViewController.h"
#import "TermoTableViewController.h"
#import "NSDictionary+TermoRecord.h"

@interface TermoViewController ()

@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;

@end

@implementation TermoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    
    self.lbTermo.text = self.Detail.nomeTermo;
    self.txSignificado.text = self.Detail.sigTermo;
    
    Speak *speak = [Speak new];
    [speak speak01:self.lbTermo.text test:self.synthesizer];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
