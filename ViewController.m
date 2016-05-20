//
//  ViewController.m
//  添加按钮的点击的声音
//
//  Created by lixiangyang on 16/5/19.
//  Copyright © 2016年 lixiangyang. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>
@interface ViewController ()<AVAudioPlayerDelegate>
{
    AVAudioPlayer *myPlay;
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
    UIButton *my = [UIButton buttonWithType:UIButtonTypeCustom];
    my.backgroundColor = [UIColor grayColor];
    my.frame = CGRectMake(30, 70, 100, 50);
    [my addTarget:self action:@selector(myEvent) forControlEvents:(UIControlEventTouchUpInside)];
    
    [self.view addSubview:my];
    
    
    NSString *path = [[NSBundle mainBundle]pathForResource:@"buttonEffet" ofType:@"mp3"];
    myPlay = [[AVAudioPlayer alloc]initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
    myPlay.delegate  = self;

}

- (void)myEvent {
    
        [myPlay play];
}

- (void)audioPlayerDidFinishPlaying:(AVAudioPlayer *)player successfully:(BOOL)flag {
    
    NSLog(@"完成播放");
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
