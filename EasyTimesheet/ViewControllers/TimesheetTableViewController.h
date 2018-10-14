//
//  TimesheetTableViewController.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertsViewController.h"
#import "DatabaseProvider.h"
#import "TimesheetCell.h"
#import "TimeSheetTableViewCell.h"
#import "EditTimesheetViewController.h"
@import Firebase;

@interface TimesheetTableViewController : UITableViewController

@property NSMutableArray *timesheetArray;
- (IBAction)filterButton:(id)sender;

@end
