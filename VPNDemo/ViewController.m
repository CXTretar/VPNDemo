//
//  ViewController.m
//  VPNDemo
//
//  Created by Felix on 2018/2/26.
//  Copyright © 2018年 Felix. All rights reserved.
//

#import "ViewController.h"
#import "NSObject+NetworkStateOrRSSI.h"
#import <NetworkExtension/NetworkExtension.h>

@interface ViewController ()

@property (nonatomic, strong) NSObject *netManager;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.netManager = [NSObject new];
    
    NSTimer *timer = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self selector:@selector(getInternetface) userInfo:nil repeats:YES];
    
    [timer fireDate];
    [self VPNStart];
}

- (void)VPNStart {
    NEVPNManager *manager = [NEVPNManager sharedManager];
    [manager loadFromPreferencesWithCompletionHandler:^(NSError * _Nullable error) {
        if(error) {
            NSLog(@"Load error: %@", error);
        } else {
            // No errors! The rest of your codes goes here..
            
        }
    }];
    
}

- (void)getInternetface {
    [self.netManager detectionBytes];
    
    NSLog(@"下行流量 %u/KB", self.netManager.nowIBytes);
    NSLog(@"上行流量 %u/KB", self.netManager.nowOBytes);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
