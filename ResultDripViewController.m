//
//  ResultDripViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "ResultDripViewController.h"
#import "DripViewController.h"

@interface ResultDripViewController ()

@end

@implementation ResultDripViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.lbPaciente.text = self.nome;
    self.lbResult.text = self.resultado;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

@end
