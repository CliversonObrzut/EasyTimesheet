//
//  CompanyTableViewController.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AlertsViewController.h"
#import "DatabaseProvider.h"
#import "CompanyCell.h"
#import "CompanyTableViewCell.h"
#import "CompanyCRUDViewController.h"
@import Firebase;

@interface CompanyTableViewController : UITableViewController

@property NSMutableArray *companyArray;
- (IBAction)addCompanyButton:(id)sender;

@end
