//
//  FilterTimesheetViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 23/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "FilterTimesheetViewController.h"

@interface FilterTimesheetViewController ()

@end

@implementation FilterTimesheetViewController
@synthesize companyTextField, startDateTextField, endDateTextField;

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
        [companyTextField resignFirstResponder];
        [startDateTextField resignFirstResponder];
        [endDateTextField resignFirstResponder];
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

- (IBAction)SearchButton:(id)sender {
    // TODO
}
@end
