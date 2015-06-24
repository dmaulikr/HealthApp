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
@synthesize lbResult, temporal;
- (void)viewDidLoad {
    [super viewDidLoad];
    [lbResult setText:temporal];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




@end
