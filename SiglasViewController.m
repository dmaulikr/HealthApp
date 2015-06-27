//
//  SiglasViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "SiglasViewController.h"
#import "SiglasTableViewController.h"
#import "Sound.h"

@interface SiglasViewController () <AVSpeechSynthesizerDelegate>

@end

@implementation SiglasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.synthesizer = [[AVSpeechSynthesizer alloc] init];
    self.synthesizer.delegate = self;
    
    self.lbSiglas.text = [self.Detail objectForKey:@"nome"];
    self.tvSiglas.text = [self.Detail objectForKey:@"significado"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (IBAction)btOuvir:(id)sender {
    Sound *sound = [Sound new];
    [sound parameter01:self.lbSiglas.text parameter02:self.tvSiglas.text parameter03:self.synthesizer];
}
@end
