//
//  SearchDetailViewController.m
//  HealthApp
//
//  Created by Rony Peterson V Conde on 24/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "SearchDetailViewController.h"
#import "TermoTableViewController.h"
#import "NSDictionary+TermoRecord.h"

@interface SearchDetailViewController ()

@end

@implementation SearchDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    self.lbNome.text = self.Detail.nomeTermo;
    self.txSignificado.text = self.Detail.sigTermo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
