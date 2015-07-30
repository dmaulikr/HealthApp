//
//  SearchDetailViewController.h
//  HealthApp
//
//  Created by Rony Peterson V Conde on 24/06/15.
//  Copyright (c) 2015 Filipe Silva. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Sound.h"
#import <AVFoundation/AVFoundation.h>

@interface SearchDetailViewController : UIViewController <AVSpeechSynthesizerDelegate>

@property (strong, nonatomic) AVSpeechSynthesizer *synthesizer;
@property (strong, nonatomic) NSDictionary *Detail;
@property (strong, nonatomic) IBOutlet UILabel *lbNome;
@property (strong, nonatomic) IBOutlet UITextView *txSignificado;


@end

