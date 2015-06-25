//
//  DripViewController.m
//  HealthApp
//
//  Created by Andrew Gama Branches on 09/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "DripViewController.h"
#import "ResultDripViewController.h"

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
}


-(BOOL)textFieldShouldReturn:(UITextField *)textField{
    
    [textField resignFirstResponder];
    
    return TRUE;
}

//-(void)textFieldDidBeginEditing:(UITextField *)textField{
//    //MOSTRAR O DATEPICKER AQUI
//    if (self.tfPaciente) {
//        self.datePicker.hidden = NO;
//    }
//    
//}
//
-(void)textFieldDidEndEditing:(UITextField *)textField {
    //ESCONDER O DATEPICKER AQUI

    self.datePicker.hidden = YES;
   // self.datePicker.hidden = YES;
}


- (void)calculatorDrip
{
    NSString *valorSolucao =  self.tfQuantity.text;
    int valorSolucao1 = [valorSolucao intValue];
    
    NSDateFormatter *hora = [[NSDateFormatter alloc] init];
    [hora setDateFormat:@"HH"];
    NSString *tempo = [hora stringFromDate:self.datePicker.date];
    float stringFloathora = [tempo floatValue];
    
    NSDateFormatter *minuto = [[NSDateFormatter alloc] init];
    [minuto setDateFormat:@"mm"];
    NSString *tempo_minuto = [minuto stringFromDate:self.datePicker.date];
    float stringFloatminuto = [tempo_minuto floatValue];
    
    float total = stringFloathora+(stringFloatminuto/60);
    
    if (self.typeSegmented.selectedSegmentIndex == 0)
    {
        float microgotas = (valorSolucao1/(total));
        NSLog(@"microgotas: %.0f", microgotas);
        self.lbResult.text = [[NSString alloc] initWithFormat:@"%.0f", microgotas];
        NSLog(@"test: %@", self.lbResult);
        self.lbResult.hidden = YES;
        
    }
    else
    {
        float macrogotas = (valorSolucao1/(total*3));
        self.lbResult.text = [[NSString alloc] initWithFormat:@"%.0f", macrogotas];
        self.lbResult.hidden = YES;
    }
    
}

- (IBAction)dtP:(id)sender {
    self.datePicker.hidden = NO;
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

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSLog(@"prepareForSegue: %@", segue.identifier);
    
    if ([segue.identifier isEqualToString:@"dados"]) {
        ResultDripViewController *test = [segue destinationViewController];
        //ResultDripViewController *test1 = [segue destinationViewController];
        test.temporal = self.lbResult.text;
        test.temporal1 = self.tfPaciente.text;
        
 
}
}
@end
