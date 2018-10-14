//
//  RegisterViewController.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../Alert/AlertsViewController.h"
#import "../Provider/DatabaseProvider.h"
#import "UserModel.h"
@import Firebase;

@interface RegisterViewController : UIViewController

@property (nonatomic, readwrite) DatabaseProvider *dbProvider;
@property (weak, nonatomic) IBOutlet UITextField *emailRegTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordRegTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingActivity;

- (IBAction)registerButton:(id)sender;
- (IBAction)cancelButton:(id)sender;

@end
