//
//  HomeViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController
@synthesize tsDate, tsHour, tsMinute, tsCompany, datePicker, timePicker;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setDatePicker];
}

-(void) setDatePicker {
    self.datePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    self.timePicker = [[UIDatePicker alloc] initWithFrame:CGRectZero];
    
    [self.datePicker setDatePickerMode:UIDatePickerModeDate];
    [self.timePicker setDatePickerMode:UIDatePickerModeTime];
    
    [self.datePicker addTarget:self action:@selector(onDatePickerValueChanged:) forControlEvents:UIControlEventAllEvents];
    [self.timePicker addTarget:self action:@selector(onTimePickerValueChanged:) forControlEvents:UIControlEventAllEvents];
    self.tsDate.inputView = self.datePicker;
    self.tsHour.inputView = self.timePicker;
    self.tsMinute.inputView = self.timePicker;
}
- (void) getDate {
    
}
- (void) onDatePickerValueChanged:(UIDatePicker *) datePicker {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
     [dateFormatter setDateFormat:@"dd/MM/yyyy"];
    self.tsDate.text = [dateFormatter stringFromDate:datePicker.date];
}

- (void) onTimePickerValueChanged:(UIDatePicker *) timePicker {
    NSDateFormatter *hourFormatter = [[NSDateFormatter alloc] init];
    NSDateFormatter *minuteFormatter = [[NSDateFormatter alloc] init];
    [hourFormatter setDateFormat:@"HH"];
    [minuteFormatter setDateFormat:@"mm"];
    self.tsHour.text = [hourFormatter stringFromDate:timePicker.date];
    self.tsMinute.text = [minuteFormatter stringFromDate:timePicker.date];
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

- (IBAction)inOutSelector:(UISwitch *)sender {
}
- (IBAction)doneButton:(id)sender {
}
- (IBAction)logoutButton:(id)sender {
    @try{
        NSError *signOutError;
        BOOL status = [[FIRAuth auth] signOut:&signOutError];
        
        if (!status) {
            AlertsViewController *alertError = [[AlertsViewController alloc]init];
            [alertError displayAlertMessage: [NSString stringWithFormat:@"%@ %@", const_error_sign_out, signOutError]];
            
            return;
        }else{
            [self performSegueWithIdentifier:@"logout_identifier_segue" sender:nil];
        }
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}
@end
