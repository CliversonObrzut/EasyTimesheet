//
//  CompanyCRUDViewController.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CompanyCell.h"

@interface CompanyCRUDViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextField *companyTextField;
@property (weak, nonatomic) IBOutlet UITextField *startDateTextField;
@property (weak, nonatomic) IBOutlet UITextField *monTextField;
@property (weak, nonatomic) IBOutlet UITextField *tueTextField;
@property (weak, nonatomic) IBOutlet UITextField *wedTextField;
@property (weak, nonatomic) IBOutlet UITextField *thuTextField;
@property (weak, nonatomic) IBOutlet UITextField *friTextField;
@property (weak, nonatomic) IBOutlet UITextField *satTextField;
@property (weak, nonatomic) IBOutlet UITextField *sunTextField;
@property CompanyCell* companySegue;
- (IBAction)saveButton:(id)sender;

@end
