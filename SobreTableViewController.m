//
//  SobreTableViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 06/08/15.
//  Copyright © 2015 Filipe Silva. All rights reserved.
//

#import "SobreTableViewController.h"

@interface SobreTableViewController()
@end

@implementation SobreTableViewController

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
    return 4;
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
    else
    {
        name = @"Cell4";
    }
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:name];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath

{
    if(indexPath.section == 0 && indexPath.row == 0)
    {
        if([MFMailComposeViewController canSendMail] == YES)
        {
            MFMailComposeViewController *mailController = [MFMailComposeViewController new];
            mailController.mailComposeDelegate = self;
            mailController.navigationBar.tintColor = [UIColor whiteColor];
            [mailController setToRecipients:@[@"app.meddict@gmail.com"]];
            [mailController setSubject:@"Sugestões"];
            [self presentViewController:mailController animated:YES completion:NULL];
        }
        else
        {
            UIAlertView *mensagem = [[UIAlertView alloc]initWithTitle:@"Informação" message:@"Configure seu Email no Dispositivo" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
            [mensagem show];
            [tableView deselectRowAtIndexPath:indexPath animated:false];
        }
    }
}

-(void)mailComposeController:(MFMailComposeViewController *)controller didFinishWithResult:(MFMailComposeResult)result error:(NSError *)error
{
    UIAlertView *mensagem;
    if(result)
    {
        mensagem = [[UIAlertView alloc]initWithTitle:@"Envio" message:@"Email enviado com sucesso" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    if(error)
    {
        mensagem = [[UIAlertView alloc]initWithTitle:@"Erro" message:@"Problema ao enviar a mensagem" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
    }
    [mensagem show];
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end