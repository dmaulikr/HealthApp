//
//  NSDictionary+TermosRecord.h
//  HealthApp
//
//  Created by Rony Peterson V Conde on 23/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (TermoRecord)

@property (readonly) NSString *nomeTermo;
@property (readonly) NSString *sigTermo;

+ (NSDictionary *) dictionaryForTermoRecordWithNomeTermo:(NSString *) nome
                                                sigTermo:(NSString *) significado;

@end
