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
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
