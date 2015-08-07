//
//  TableViewController.m
//  HealthApp
//
//  Created by Filipe da Silva Oliveira on 10/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@property NSUserDefaults *prefs;

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
    self.prefs = [NSUserDefaults standardUserDefaults];
    if([self.prefs boolForKey:@"CONTRATO"] == false)
    {
        [self.prefs setBool:true forKey:@"CONTRATO"];
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Termo de Uso" message:@"Este aplicativo possui caráter apenas informativos e não substitui orientação, diagnóstico ou tratamento prestado por seu médico ou por outro profissional de saúde. Não nos responsabilizamos pelo uso indevido de nossa ferramenta." delegate:self cancelButtonTitle:@"Aceito" otherButtonTitles:@"Não Aceito", nil];
        [theAlert show];
    }
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger) buttonIndex
{
    
    if(buttonIndex != 0)
    {
        [self.prefs setBool:false forKey:@"CONTRATO"];
        exit(0);
    }
    [self.prefs synchronize];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    return cell;
}

@end