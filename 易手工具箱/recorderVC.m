//
//  recorderVC.m
//  易手工具箱
//
//  Created by fungjack on 2017/3/28.
//  Copyright © 2017年 fungjack. All rights reserved.
//

#import "recorderVC.h"

@implementation recorderVC

#pragma mark - viewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    [self setAudioSession];
}

#pragma mark - Function

- (void)setAudioSession{
    UInt32 sessionCategory = kAudioSessionCategory_MediaPlayback;
    AudioSessionSetProperty(kAudioSessionProperty_AudioCategory, sizeof(sessionCategory), &sessionCategory);
    UInt32 audioRouteOverride = kAudioSessionOverrideAudioRoute_Speaker;
    AudioSessionSetProperty (kAudioSessionProperty_OverrideAudioRoute,sizeof (audioRouteOverride),&audioRouteOverride);
    AVAudioSession *audioSession = [AVAudioSession sharedInstance];
    [audioSession setCategory:AVAudioSessionCategoryPlayAndRecord error:nil];
    [audioSession setActive:YES error:nil];
}

-(NSURL *)getSavePath{//获取保存文件路径
    NSString *urlStr=[NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    urlStr=[urlStr stringByAppendingPathComponent:@"/testRecord.caf"];
    NSLog(@"file path:%@",urlStr);
    NSURL *url=[NSURL fileURLWithPath:urlStr];
    return url;
}

-(NSDictionary *)getAudioSetting{//获取录音设置
    NSMutableDictionary *dicM=[NSMutableDictionary dictionary];
    //设置录音格式
    [dicM setObject:@(kAudioFormatLinearPCM) forKey:AVFormatIDKey];
    //设置录音采样率，8000是电话采样率，对于一般录音已经够了
    [dicM setObject:@(8000) forKey:AVSampleRateKey];
    //设置通道,这里采用单声道
    [dicM setObject:@(1) forKey:AVNumberOfChannelsKey];
    //每个采样点位数,分为8、16、24、32
    [dicM setObject:@(8) forKey:AVLinearPCMBitDepthKey];
    //是否使用浮点数采样
    [dicM setObject:@(YES) forKey:AVLinearPCMIsFloatKey];
    //....其他设置等
    return dicM;
}

-(AVAudioRecorder *)audioRecorder{//获取录音机对象
    if (!_audioRecorder) {
        //创建录音文件保存路径
        NSURL *url=[self getSavePath];
        //创建录音格式设置
        NSDictionary *setting=[self getAudioSetting];
        //创建录音机
        NSError *error=nil;
        _audioRecorder=[[AVAudioRecorder alloc]initWithURL:url settings:setting error:&error];
        _audioRecorder.delegate=self;
        _audioRecorder.meteringEnabled=YES;//如果要监控声波则必须设置为YES
        if (error) {
            NSLog(@"创建录音机对象时发生错误，错误信息：%@",error.localizedDescription);
            return nil;
        }
    }
    return _audioRecorder;
}

-(AVAudioPlayer *)audioPlayer{//获取播放器对象
    
    
    if (!_audioPlayer) {
        NSURL *url=[self getSavePath];
        NSError *error=nil;
        _audioPlayer=[[AVAudioPlayer alloc]initWithContentsOfURL:url error:&error];
        _audioPlayer.numberOfLoops=0;
        [_audioPlayer prepareToPlay];
        if (error) {
            NSLog(@"创建播放器过程中发生错误，错误信息：%@",error.localizedDescription);
            return nil;
        }
    }
    return _audioPlayer;
}

- (NSTimer *)Timer{//获取计时器对象
    if (!_Timer) {
        _Timer = [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(audioPowerChange) userInfo:nil repeats:YES];
    }
    return _Timer;
}

- (void)audioPowerChange{
    [self.audioRecorder updateMeters];//更新测量值
    float power= [self.audioRecorder averagePowerForChannel:0];//取得第一个通道的音频，注意音频强度范围时-160到0
    CGFloat progress = (power+160.0)/160;
    [self.volume setProgress:progress];
}

#pragma mark - UI事件

- (IBAction)startRecord:(id)sender {
    _statusLabel.text = @"正在录音";
    if (![self.audioRecorder isRecording]) {//如果recoder没有在录音
        self.Timer.fireDate = [NSDate distantPast];
        [self.audioRecorder record];
        
    }
}



- (IBAction)stopRecord:(id)sender {
    _statusLabel.text = @"录音停止";
    if ([self.audioRecorder isRecording]) {
        [self.audioRecorder stop];
        self.Timer.fireDate = [NSDate distantFuture];
        self.volume.progress=0.0;
    }
}

- (IBAction)playRecord:(id)sender {
    _statusLabel.text = @"正在播放";
    if (![self.audioPlayer isPlaying]) {
        [self.audioPlayer play];
    }
}

-(void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag{
    _statusLabel.text = @"录音完成";
}


@end
