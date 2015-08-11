//
//  SobreTableViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 06/08/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "SobreTableViewController.h"

@interface SobreTableViewController ()


@end

@implementation SobreTableViewController

MFMailComposeViewController *formularioEmail;

- (void)viewDidLoad
{
    [super viewDidLoad];
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
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *name;
    if(indexPath.row == 0)
    {
        name = @"Cell1";
    }
    else if(indexPath.row == 1)
    {
        name = @"Cell2";
    }
    else if(indexPath.row == 2)
    {
        name = @"Cell3";
    }
    else if(indexPath.row == 3)
    {
        name = @"Cell4";
    }
    else if(indexPath.row == 4)
    {
        name = @"Cell5";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{

    //[tableView cellForRowAtIndexPath:indexPath].accessoryType = UITableViewCellAccessoryCheckmark;

    if (indexPath.section == 0 && indexPath.row == 0) {
        
        formularioEmail = [[MFMailComposeViewController alloc]init];
        
        formularioEmail.mailComposeDelegate = self;
        
        formularioEmail.navigationBar.tintColor = [UIColor whiteColor];
        
        [formularioEmail setToRecipients:@[@"app.meddict@gmail.com"]];
        
        // setSubject adiciona um assunto ao email
        
        [formularioEmail setSubject:@"Sugestões"];
        
        // temos agora o corpo da mensagem
        
        [formularioEmail setMessageBody:@"Enviamos nossa mensagem" isHTML:NO];
        
        //[self presentModalViewController:formularioEmail animated:YES];
         [self presentViewController:formularioEmail animated:YES completion:NULL];

    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller

         didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error{
    
    UIAlertView *mensagem;
    
    if (result) {
        
        mensagem = [[UIAlertView alloc]initWithTitle:@"Enviado" message:@"Email enviado com sucesso" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        
    }
    
    if (error) {
        
        mensagem = [[UIAlertView alloc]initWithTitle:@"Erro" message:@"Erro ao enviar mensagem" delegate:self cancelButtonTitle:@"ok" otherButtonTitles:nil, nil];
        
    }
    
    [mensagem show];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
        
        
        

@end