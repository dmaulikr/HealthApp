//
//  TermoViewController.h
//  HealthApp
//
//  Created by Andrew Gama Branches on 15/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "TermoTableViewController.h"
#import "NSDictionary+TermoRecord.h"

@interface TermoViewController : UIViewController <UIApplicationDelegate, AVSpeechSynthesizerDelegate>

@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property (strong, nonatomic) NSDictionary *Detail;
@property (strong, nonatomic) IBOutlet UILabel *lbTermo;
@property (strong, nonatomic) IBOutlet UITextView *txSignificado;


@end
