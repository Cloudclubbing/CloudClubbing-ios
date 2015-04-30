//
//  MyAccountView.h
//  CloudClubbing1
//
//  Created by Zaven Hakobyan on 30/04/2015.
//  Copyright (c) 2015 CloudClubbing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAccountView : UIViewController

@property (weak, nonatomic) IBOutlet UIBarButtonItem *barButton;

@property (weak, nonatomic) IBOutlet UITextField *idTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;

- (IBAction)connectionButton:(id)sender;


@property (weak, nonatomic) IBOutlet UIButton *registerButton;


@end
