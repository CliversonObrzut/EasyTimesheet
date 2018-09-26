//
//  TimeSheetTableViewCell.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimeSheetTableViewCell : UITableViewCell
- (IBAction)editButton:(id)sender;
@property (weak, nonatomic) IBOutlet UILabel *amountLabel;
@property (weak, nonatomic) IBOutlet UILabel *grossPayLabel;
@property (weak, nonatomic) IBOutlet UILabel *dayRateLabel;
@property (weak, nonatomic) IBOutlet UILabel *companyNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *startEndLabel;
@property (weak, nonatomic) IBOutlet UILabel *dateLabel;

@end
