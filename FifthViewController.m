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



@end

@implementation FifthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lbSig.text = [self.Detail objectForKey:@"nome"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
