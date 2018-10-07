//
//  HomeViewController.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *tsDate;
@property (weak, nonatomic) IBOutlet UITextField *tsHour;
@property (weak, nonatomic) IBOutlet UITextField *tsMinute;
- (IBAction)inOutSelector:(UISwitch *)sender;
@property (weak, nonatomic) IBOutlet UITextField *tsCompany;
- (IBAction)doneButton:(id)sender;
@property UIDatePicker *datePicker;
@property UIDatePicker *timePicker;
@property UIDatePicker *cohmpanyPicker;

@end
