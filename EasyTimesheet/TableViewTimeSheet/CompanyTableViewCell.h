//
//  CompanyTableViewCell.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 14/10/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CompanyTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
- (IBAction)editCompanyButton:(id)sender;
@end
