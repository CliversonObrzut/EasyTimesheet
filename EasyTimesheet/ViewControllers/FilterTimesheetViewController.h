//
//  FilterTimesheetViewController.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 23/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertsViewController.h"
#import "DatabaseProvider.h"
@import Firebase;

@interface FilterTimesheetViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *endDateTextField;
- (IBAction)SearchButton:(id)sender;

@end
