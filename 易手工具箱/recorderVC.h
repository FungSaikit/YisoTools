//
//  recorderVC.h
//  易手工具箱
//
//  Created by fungjack on 2017/3/28.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <Foundation/NSData.h>
#import <AudioToolbox/AudioToolbox.h>

@interface recorderVC : UIViewController<AVAudioRecorderDelegate>
@property (strong, nonatomic) IBOutlet UIProgressView *volume;
@property (strong, nonatomic) AVAudioRecorder *audioRecorder;
@property (strong, nonatomic) AVAudioPlayer *audioPlayer;
@property (strong, nonatomic) NSTimer *Timer;
@property (strong, nonatomic) IBOutlet UILabel *statusLabel;

- (IBAction)startRecord:(id)sender;
- (IBAction)stopRecord:(id)sender;
- (IBAction)playRecord:(id)sender;


@end
