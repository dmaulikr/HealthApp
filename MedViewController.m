//
//  MedViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 29/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "MedViewController.h"

@interface MedViewController ()

@end

@implementation MedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = [self.Detail objectForKey:@"nome"];
    self.tvForma.text = [self.Detail objectForKey:@"formadeadm"];
    self.tvadmin.text = [self.Detail objectForKey:@"administração"];
    self.tvDose.text = [self.Detail objectForKey:@"dose"];
    self.tvAcao.text = [self.Detail objectForKey:@"acao"];
    self.tvReacao.text = [self.Detail objectForKey:@"reacao"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
