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
    
    self.lbTermo.text = self.Detail.nomeTermo;
    self.txSignificado.text = self.Detail.sigTermo;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


@end
