//
//  RegisterViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

@synthesize dbProvider, emailRegTextField, passwordRegTextField, loadingActivity;

// Class constants
NSString *const register_segue = @"register_identifier_segue";
NSString *const login_segue = @"register_back_identifier_segue";

- (void)viewWillAppear:(BOOL)animated{
    @try{
        [super viewWillAppear:animated];
        //Hide Activity Indicator
        loadingActivity.hidden = YES;
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

- (void)viewDidLoad {
    @try {
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
        [emailRegTextField resignFirstResponder];
        [passwordRegTextField resignFirstResponder];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - Buttons

/**
 *
 * Method to create User Account
 * @author: Cliverson Obrzut
 *
 */
- (IBAction)registerButton:(id)sender {
    @try{
        self.loadingActivity.hidden = NO;
        [loadingActivity startAnimating];
        
        
        if(![emailRegTextField.text isEqualToString:@""] ||
           ![passwordRegTextField.text isEqualToString:@""])
        {
            //Regex Validation form Email
            NSString *regexEmailPattern = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
            NSString *emailInput = [emailRegTextField text];
            NSRange emailRange = NSMakeRange(0, [emailInput length]);
            NSError *error = nil;
            
            NSRegularExpression *regex = [NSRegularExpression regularExpressionWithPattern:regexEmailPattern options:0 error:&error];
            
            NSTextCheckingResult *emailMatch = [regex firstMatchInString:emailInput options:0 range:emailRange];
            
            if(emailMatch){
                NSString *userEmail = emailRegTextField.text;
                NSString *userPassword = passwordRegTextField.text;
                
                [[FIRAuth auth]
                 createUserWithEmail: userEmail
                 password: userPassword
                 completion:^(FIRAuthDataResult * _Nullable authResult, NSError * _Nullable error) {
                     
                     self.loadingActivity.hidden = YES;
                     [self.loadingActivity stopAnimating];
                     
                     //Error or Result
                     if(authResult != nil){
                         
                         //Insert new User Profile
                         self.dbProvider = [[DatabaseProvider alloc] init];
                         [self.dbProvider addNewUser: userEmail];
                         
                         //Go to Home screen
                         [self performSegueWithIdentifier:register_segue sender:self];
                     }
                     else{
                         //error
                         AlertsViewController *errorFirebase = [[AlertsViewController alloc] init];
                         [errorFirebase displayAlertMessage:[NSString stringWithFormat:@"%@",error.localizedDescription]];
                     }
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
        else{
            self.loadingActivity.hidden = YES;
            [self.loadingActivity stopAnimating];
            //Display error input MSGs
            AlertsViewController *errAlert = [[AlertsViewController alloc] init];
            [errAlert displayAlertMessage:const_no_input_alert_message];
        }
    }
    @catch(NSException *ex){
        //Stop and hide Activity Indicator
        loadingActivity.hidden = YES;
        [loadingActivity stopAnimating];
        
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

/**
 *
 * Dismiss current view
 * @author Cliverson Obrzut
 */
- (IBAction)cancelButton:(id)sender {
    [self performSegueWithIdentifier:login_segue sender:self];
}

@end
