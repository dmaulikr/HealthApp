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

- (BOOL)textFieldShouldBeginEditing:(nonnull UITextField *)textField
{
    NSLog(@"Teste - 1");
    return TRUE;
}

- (void)textFieldDidBeginEditing:(nonnull UITextField *)textField
{
    NSLog(@"Teste - 2");
    if(textField == self.tfPaciente)
    {
        NSLog(@"A");
        if([self.tfQuantity.text isEqualToString:@""])
        {
            NSLog(@"B");
            self.tfQuantity.enabled = FALSE;
        }
    }
    else
    {
        NSLog(@"C");
        self.tfQuantity.enabled = TRUE;
        self.datePicker.hidden = FALSE;
    }
}

- (BOOL)textFieldShouldClear:(nonnull UITextField *)textField
{
    NSLog(@"Teste - 5");
    return TRUE;
}

- (BOOL)textFieldShouldReturn:(nonnull UITextField *)textField
{
    NSLog(@"Teste - 4");
    [textField resignFirstResponder];
    return TRUE;
}

- (void)textFieldDidEndEditing:(nonnull UITextField *)textField
{
    NSLog(@"Teste - 3");
    if(textField == self.tfQuantity)
    {
        if([self.tfPaciente.text isEqualToString:@""] == YES)
        {
            self.datePicker.hidden = FALSE;
        }
    }
    else
    {
        NSLog(@"F");
        if([textField.text isEqualToString:@""] == NO)
        {
            NSLog(@"G");
            self.tfQuantity.enabled = TRUE;
            self.datePicker.hidden = TRUE;
        }
        else
        {
            NSLog(@"H");
            self.tfQuantity.enabled = NO;
        }
    }
}

//- (void)touchesBegan:(nonnull NSSet<UITouch *> *)touches withEvent:(nullable UIEvent *)event
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"I");
    [self.tfPaciente resignFirstResponder];
    [self.tfQuantity resignFirstResponder];
    if([self.tfPaciente.text isEqualToString:@""] == NO)
    {
        self.tfQuantity.selected = TRUE;
    }
    if([self.tfPaciente.text isEqualToString:@""] == NO && [self.tfQuantity.text isEqualToString:@""] == NO)
    {
        self.btCalculate.enabled = TRUE;
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
    self.datePicker.hidden = TRUE;
    self.tfQuantity.text = nil;
    self.tfQuantity.enabled = FALSE;
    self.tfPaciente.text = nil;
    self.btCalculate.enabled = FALSE;
}

@end
