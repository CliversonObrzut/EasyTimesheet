//
//  EditTimesheetViewController.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertsViewController.h"
#import "DatabaseProvider.h"
#import "TimesheetCell.h"
@import Firebase;

@interface EditTimesheetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *workedDate;
@property (weak, nonatomic) IBOutlet UITextField *startHourTextField;
@property (weak, nonatomic) IBOutlet UITextField *startMinuteTextField;
@property (weak, nonatomic) IBOutlet UITextField *endHourTextField;
@property (weak, nonatomic) IBOutlet UITextField *endMinuteTextField;
@property (weak, nonatomic) IBOutlet UITextField *dayRateTextField;
@property TimesheetCell* timesheetSegue;
- (IBAction)deleteButton:(id)sender;
- (IBAction)saveButton:(id)sender;


@end
