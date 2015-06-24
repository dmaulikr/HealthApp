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

@end

@implementation TermoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.lbTermo.text = self.Detail.nomeTermo;
    self.txSignificado.text = self.Detail.sigTermo;
    
//    self.lbTermo.text = [self.Detail objectForKey:@"nome"];
//    self.txSignificado.text = [self.Detail objectForKey:@"significado"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
