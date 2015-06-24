//
//  SiglasViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 23/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "SiglasViewController.h"
#import "SiglasTableViewController.h"

@interface SiglasViewController ()

@end

@implementation SiglasViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lbSiglas.text = [self.Detail objectForKey:@"nome"];
    self.tvSiglas.text = [self.Detail objectForKey:@"significado"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
