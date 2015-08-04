//
//  TableViewController.m
//  HealthApp
//
//  Created by Filipe da Silva Oliveira on 10/06/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "TableViewController.h"

@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.separatorColor = [UIColor clearColor];
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Termo de Uso" message:@"Este aplicativo serve apenas para fins informativos e não pretende ser um substituto de orientação, diagnóstico ou tratamento prestado por seu médico ou por outro profissional de saúde. Não nós responsabilizamos por o uso indevido de nossa ferramenta. Você aceita o Termo de Uso?" delegate:self cancelButtonTitle:@"Aceito" otherButtonTitles:@"Não Aceito", nil];
    [theAlert show];
}

- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger) buttonIndex
{
    
    if(buttonIndex != 0)
    {
        exit(0);
    }
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