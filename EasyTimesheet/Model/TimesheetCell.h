//
//  TimesheetCell.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 14/10/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TimesheetCell : NSObject

@property NSString *company;
@property NSString *workedDate;
@property NSString *startTime;
@property NSString *endTime;
@property NSString *payRate;
@property NSString *amount;

@end
