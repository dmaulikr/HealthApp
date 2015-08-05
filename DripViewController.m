//
//  DripViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 09/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "DripViewController.h"

@interface DripViewController () <UITextFieldDelegate>

@end

@implementation DripViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
}

- (BOOL)textFieldShouldReturn:(nonnull UITextField *)textField
{
    [textField resignFirstResponder];
    return TRUE;
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self.tfPaciente resignFirstResponder];
    [self.tfQuantity resignFirstResponder];
    if(![self.tfPaciente.text isEqualToString:@""] && ![self.tfQuantity.text isEqualToString:@""])
    {
        self.btCalculate.enabled = TRUE;
    }
    else
    {
        self.btCalculate.enabled = FALSE;
    }
}

- (IBAction)btCalculate:(id)sender
{
    int quantidade = [self.tfQuantity.text intValue];
    NSDateFormatter *dateFormatter = [NSDateFormatter new];
    [dateFormatter setDateFormat:@"HH"];
    float hora = [[dateFormatter stringFromDate:self.datePicker.date] floatValue];
    [dateFormatter setDateFormat:@"mm"];
    float minuto = [[dateFormatter stringFromDate:self.datePicker.date] floatValue];
    float tempo = hora+(minuto/60);
    if(self.typeSegmented.selectedSegmentIndex == 0)
    {
        float macrogotas = (quantidade/(tempo*3));
        self.calculo = [[NSString alloc] initWithFormat:@"%.0f", macrogotas];
    }
    else
    {
        float microgotas = (quantidade/(tempo));
        self.calculo = [[NSString alloc] initWithFormat:@"%.0f", microgotas];
    }
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if([segue.identifier isEqualToString:@"dados"])
    {
        ResultDripViewController *test = [segue destinationViewController];
        test.nome = self.tfPaciente.text;
        test.resultado = self.calculo;
    }
    self.tfQuantity.text = nil;
    self.tfPaciente.text = nil;
    self.btCalculate.enabled = FALSE;
}

@end