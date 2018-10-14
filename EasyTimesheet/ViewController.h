//
//  ViewController.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 18/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertsViewController.h"
@import Firebase;

@interface ViewController : UIViewController

@property (strong, nonatomic) FIRAuthStateDidChangeListenerHandle handle;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UIActivityIndicatorView *loadingActivity;

- (IBAction)LoginButton:(id)sender;
- (IBAction)RegisterNavButton:(id)sender;


@end

