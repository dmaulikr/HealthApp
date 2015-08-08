//
//  SinaisViewController.m
//  HealthApp
//
//  Created by Rony Peterson V Conde on 30/07/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "SinaisViewController.h"
#import "SinaisTableViewController.h"

@implementation SinaisViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = [self.Detail objectForKey:@"nome"];
    
    self.lbSinais.text = [self.Detail objectForKey:@"nome"];
    self.tvSinais.text = [self.Detail objectForKey:@"significado"];
    self.tv2Sinais.text = [self.Detail objectForKey:@"valores"];
}

@end
