//
//  AlertsViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 07/10/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.

#import "AlertsViewController.h"

@interface AlertsViewController ()

@end

@implementation AlertsViewController

//Constants for Alerts
NSString *const const_alert_message = @"DEFAULT..";
NSString *const const_alert_title = @"EasyTimesheet";
NSString *const const_alert_button = @"Ok";
NSString *const const_input_alert_message = @"Please fill up the Information at: ";
NSString *const const_input_alert_title = @"Empty Field";
NSString *const const_no_input_alert_message = @"Please fill information in all fields";
NSString *const const_passwords_not_matching_alert_message = @"Passwords did not match, try again";
NSString *const const_update_db_alert_message = @"Update Successfully!";
NSString *const const_upload_db_alert_message = @"Uploaded Successfully!";
NSString *const const_invalid_email_alert_message = @"E-mail format not valid!";
NSString *const const_error_sign_out = @"Error signing out: ";
NSString *const const_profile_alert_button = @"Confirm";
NSString *const const_profile_alert_cancel_button = @"Cancel";


- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

/**
 *
 * Get top view controller of the App
 * @author Cliverson Obrzut
 *
 * @return topViewController
 */
- (UIViewController *)topViewController {
    @try{
        return [self topViewController:[UIApplication sharedApplication].keyWindow.rootViewController];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

/**
 *
 * Get top view controller with rootViewController
 * @author Cliverson Obrzut
 *
 * @return topViewController
 */
- (UIViewController *)topViewController:(UIViewController *)rootViewController {
    @try{
        if (rootViewController.presentedViewController == nil) {
            return rootViewController;
        }
        
        if ([rootViewController.presentedViewController isMemberOfClass:[UINavigationController class]]) {
            UINavigationController *navigationController = (UINavigationController *)rootViewController.presentedViewController;
            UIViewController *lastViewController = [[navigationController viewControllers] lastObject];
            return [self topViewController:lastViewController];
        }
        
        UIViewController *presentedViewController = (UIViewController *)rootViewController.presentedViewController;
        return [self topViewController:presentedViewController];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

/**
 *
 * Display an Alert message based in a fieldName
 * @author Cliverson Obrzut
 *
 * @param fieldName - NSString
 *
 */
-(void)displayInputAlert: (NSString *) fieldName{
    @try{
        UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle: const_input_alert_title
                                    message: [const_input_alert_message stringByAppendingString: fieldName]
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okButton = [UIAlertAction actionWithTitle: const_alert_button
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action)
                                   {
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                   }];
        
        //Add ok button
        [alert addAction: okButton];
        
        //Display Alert
        UIViewController *rootViewController = self.topViewController;
        [rootViewController presentViewController:alert animated:YES completion:nil];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

/**
 *
 * Display Alert with message as parameter
 * @author Cliverson Obrzut
 *
 * @param message - NSString
 */
-(void)displayAlertMessage: (NSString *) message{
    @try{
        UIAlertController *alert = [UIAlertController
                                    alertControllerWithTitle: const_alert_title
                                    message: message
                                    preferredStyle:UIAlertControllerStyleAlert];
        
        UIAlertAction *okButton = [UIAlertAction actionWithTitle: const_alert_button
                                                           style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * _Nonnull action)
                                   {
                                       [alert dismissViewControllerAnimated:YES completion:nil];
                                   }];
        
        //Add ok button
        [alert addAction: okButton];
        
        //Display Alert
        UIViewController *rootViewController = self.topViewController;
        [rootViewController presentViewController:alert animated:YES completion:nil];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc] init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

@end
