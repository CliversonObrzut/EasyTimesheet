//
//  CompanyCRUDViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "CompanyCRUDViewController.h"

@interface CompanyCRUDViewController ()

@end

@implementation CompanyCRUDViewController

@synthesize companyTextField, startDateTextField, monTextField, tueTextField, wedTextField, thuTextField, friTextField, satTextField, sunTextField;

- (void)viewDidLoad {
    [super viewDidLoad];
    [self displayCompanyData];
    // Do any additional setup after loading the view.
}

- (void) displayCompanyData {
    companyTextField.text = self.companySegue.company;
    startDateTextField.text = self.companySegue.startDate;
    monTextField.text = self.companySegue.prMon;
    tueTextField.text = self.companySegue.prTue;
    wedTextField.text = self.companySegue.prWed;
    thuTextField.text = self.companySegue.prThu;
    friTextField.text = self.companySegue.prFri;
    satTextField.text = self.companySegue.prSat;
    sunTextField.text = self.companySegue.prSun;
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

- (IBAction)saveButton:(id)sender {
    // TODO
}
@end
