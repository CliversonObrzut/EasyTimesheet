//
//  ViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 18/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

//Class ENUMS
typedef NS_ENUM(NSInteger, login_view_){
    login_view_enum_dispatch_time = 1
};

// Class contants
NSString *const const_login_segue = @"login_identifier_segue";
NSString *const const_register_segue = @"register_nav_identifier_segue";

@synthesize handle, emailTextField, passwordTextField, loadingActivity;

- (void)viewWillAppear:(BOOL)animated {
    @try {
        //Hide Activity Indicator
        loadingActivity.hidden = YES;
        
        // lisntener to redirect to home screen if user is still authenticated when launching the app.
        self.handle = [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
            if(auth.currentUser) {
                [self performSegueWithIdentifier:(const_login_segue) sender:self];
            }
        }];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

-(void)viewWillDisappear:(BOOL)animated {
    [[FIRAuth auth] removeAuthStateDidChangeListener:self.handle];
}

/**
 *
 * Customise to dismiss keyboard
 * @author Cliverson Obrzut
 *
 */
- (void)viewDidLoad {
    @try{
        [super viewDidLoad];
        
        //Tap gesture to dismiss keyboard
        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]
                                       initWithTarget:self
                                       action:@selector(dismissKeyboard)];
        
        [self.view addGestureRecognizer:tap];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

/**
 *
 * Method to dismiss keyboard
 * @author Cliverson Obrzut
 *
 */
-(void)dismissKeyboard {
    @try{
        [emailTextField resignFirstResponder];
        [passwordTextField resignFirstResponder];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - Buttons

- (IBAction)LoginButton:(id)sender {
    @try{
        if([emailTextField.text isEqualToString:@""]){
            AlertsViewController *customAlert = [[AlertsViewController alloc] init];
            [customAlert displayInputAlert: [emailTextField placeholder]];
        }
        else if([passwordTextField.text isEqualToString:@""]){
            AlertsViewController *customAlert = [[AlertsViewController alloc] init];
            [customAlert displayInputAlert: [passwordTextField placeholder]];
        }
        else{
            //Regex Validation form Email
            NSString *regexEmailPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            NSString *emailInput = [emailTextField text];
            NSRange emailRange = NSMakeRange(0, [emailInput length]);
            NSError *error = nil;
            
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexEmailPattern options:0 error:&error];
            
            NSTextCheckingResult *emailMatch = [regex firstMatchInString:emailInput options:0 range:emailRange];
            
            if(emailMatch){
                
                //Disable button
                UIButton *btn = (UIButton *)sender;
                btn.enabled = NO;
                
                //Show Activity Indicator
                loadingActivity.hidden = NO;
                [loadingActivity startAnimating];
                
                //Perform login
                
                [[FIRAuth auth]
                 signInWithEmail:emailTextField.text
                 password:passwordTextField.text
                 completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
                     
                     //Wait 1 second to stop loading activity,
                     //as the result from firebase may take time..
                     dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(login_view_enum_dispatch_time * NSEC_PER_SEC)),
                                    dispatch_get_main_queue(),
                                    ^{
                                        //Stop and hide Activity Indicator
                                        self.loadingActivity.hidden = YES;
                                        [self.loadingActivity stopAnimating];
                                        
                                        if(authResult){
                                            [self performSegueWithIdentifier:const_login_segue sender:self];
                                        }
                                        else{
                                            //Enable button
                                            UIButton *btn = (UIButton *)sender;
                                            btn.enabled = YES;
                                            
                                            AlertsViewController *alertError = [[AlertsViewController alloc] init];
                                            [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", error.localizedDescription]];
                                        }
                                    });
                 }];
            }
            else{
                self.loadingActivity.hidden = YES;
                [self.loadingActivity stopAnimating];
                
                //Invalid Email
                AlertsViewController *errAlert = [[AlertsViewController alloc] init];
                [errAlert displayAlertMessage:const_invalid_email_alert_message];
            }
        }
    }
    @catch(NSException *ex){
        //Enable button
        UIButton *btn = (UIButton *)sender;
        btn.enabled = YES;
        
        //Stop and hide Activity Indicator
        loadingActivity.hidden = YES;
        [loadingActivity stopAnimating];
        
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

- (IBAction)RegisterNavButton:(id)sender {
        [self performSegueWithIdentifier:const_register_segue sender:self];
}
@end
