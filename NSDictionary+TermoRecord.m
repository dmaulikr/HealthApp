//
//  NSDictionary+TermosRecord.m
//  HealthApp
//
//  Created by Rony Peterson V Conde on 23/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import "NSDictionary+TermoRecord.h"
#import "AppDelegate.h"

NSString * const NomeTermoKey        = @"nome";
NSString * const SigTermoKey       = @"significado";

@implementation NSDictionary (TermoRecord)

- (NSString *)nomeTermo
{
    return [self valueForKey:NomeTermoKey];
}

- (NSString *)sigTermo
{
    return [self valueForKey:SigTermoKey];
}


+ (NSDictionary *) dictionaryForTermoRecordWithNomeTermo:(NSString *) nome
                                                sigTermo:(NSString *) significado


{
    NSDictionary *newRecord = @{ NomeTermoKey       : nome,
                                 SigTermoKey       : significado};
    
    return newRecord;
}

@end
