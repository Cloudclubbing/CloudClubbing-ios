//
//  MyAccountView.m
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 30/04/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import "MyAccountView.h"
#import "SWRevealViewController.h"
#import <CommonCrypto/CommonDigest.h>

@interface MyAccountView ()

@end

@implementation MyAccountView
@synthesize idTextField, passwordTextField;



- (void)viewDidLoad {
    [super viewDidLoad];
    _barButton.target = self.revealViewController;
    _barButton.action = @selector(revealToggle:);
    
    [self.view addGestureRecognizer:self.revealViewController.panGestureRecognizer];
    
    passwordTextField.secureTextEntry = YES;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




- (IBAction)connectionButton:(id)sender {
    
    NSString *userId = idTextField.text;
    NSString *userPassword = passwordTextField.text;
    
    const char *cstr = [userPassword cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:userPassword.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, (CC_LONG)data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    for (int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++){
        [output appendFormat:@"%02x", digest[i]];
    }

    NSLog(@"user: %@",userId);
    NSLog(@"pass: %@", output);
}
@end
