//
//  TimeSheetTableViewCell.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "TimeSheetTableViewCell.h"

@implementation TimeSheetTableViewCell

@synthesize amountLabel,
grossPayLabel,
dayRateLabel,
companyNameLabel,
startEndLabel,
dateLabel;

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (IBAction)editButton:(id)sender {
    
    
}

@end
