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

- (void)viewDidLoad {
    [super viewDidLoad];
    // datePicker desaparece da tela
    self.datePicker.hidden = YES;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return TRUE;
}

-(void)textFieldDidBeginEditing:(UITextField *)textField{
    //MOSTRAR O DATEPICKER AQUI
    self.datePicker.hidden = NO;
}

-(void)textFieldDidEndEditing:(UITextField *)textField {
    //ESCONDER O DATEPICKER AQUI
    self.datePicker.hidden = YES;
}

- (void)calculatorDrip
{
    NSString *valorSolucao =  self.tfQuantity.text;
    int valorSolucao1 = [valorSolucao intValue];
    
    NSDateFormatter *hora = [[NSDateFormatter alloc] init];
    [hora setDateFormat:@"HH"];
    NSString *tempo = [hora stringFromDate:self.datePicker.date];
    float stringFloathora = [tempo floatValue];
    NSLog(@"%f", stringFloathora);
    
    NSDateFormatter *minuto = [[NSDateFormatter alloc] init];
    [minuto setDateFormat:@"mm"];
    NSString *tempo_minuto = [minuto stringFromDate:self.datePicker.date];
    float stringFloatminuto = [tempo_minuto floatValue];
    NSLog(@"%f", stringFloatminuto);
    
    float total = stringFloathora+(stringFloatminuto/60);
    NSLog(@"%f", total);
    
    if (self.typeSegmented.selectedSegmentIndex == 0)
    {
        float microgotas = (valorSolucao1/(total));
        NSLog(@"microgotas: %f", microgotas);
        self.lbResult.text = [[NSString alloc] initWithFormat:@"%f", microgotas];
        self.lbResult.hidden = NO;
        
    }
    else
    {
        float macrogotas = (valorSolucao1/(total*3));
        NSLog(@"macrogotas: %f", macrogotas);
        self.lbResult.text = [[NSString alloc] initWithFormat:@"%f", macrogotas];
        self.lbResult.hidden = NO;
    }
    
}

- (IBAction)btCalculate:(id)sender {
    [self calculatorDrip];
    self.tfTime.text = nil;
    self.tfQuantity.text = nil;
    self.datePicker.hidden = YES;
}

- (IBAction)pickerAction:(id)sender {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"HH:mm"];
    
    NSString *formatedDate = [dateFormatter stringFromDate:self.datePicker.date];
    
    self.tfTime.text = formatedDate;
}
@end
