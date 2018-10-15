//
//  EditTimesheetViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "EditTimesheetViewController.h"

@interface EditTimesheetViewController ()

@end

@implementation EditTimesheetViewController

@synthesize companyTextField, workedDate, startHourTextField, startMinuteTextField, endHourTextField, endMinuteTextField, dayRateTextField, timesheetSegue;

- (void)viewDidLoad {
    @try {
        [super viewDidLoad];
        [self displayTimesheetData];
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

- (void) displayTimesheetData {
    companyTextField.text = self.timesheetSegue.company;
    workedDate.text = self.timesheetSegue.workedDate;
    startHourTextField.text = self.timesheetSegue.startTime;
    startMinuteTextField.text = self.timesheetSegue.startTime;
    endHourTextField.text = self.timesheetSegue.endTime;
    endMinuteTextField.text = self.timesheetSegue.endTime;
    dayRateTextField.text = self.timesheetSegue.payRate;
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
        [workedDate resignFirstResponder];
        [startHourTextField resignFirstResponder];
        [startMinuteTextField resignFirstResponder];
        [endHourTextField resignFirstResponder];
        [endMinuteTextField resignFirstResponder];
        [dayRateTextField resignFirstResponder];
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

- (IBAction)deleteButton:(id)sender {
    // TODO
}

- (IBAction)saveButton:(id)sender {
    // TODO
}
@end
