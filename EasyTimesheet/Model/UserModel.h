//
//  UserModel.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 13/10/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Company.h"
#import "Timesheet.h"

@interface UserModel : NSObject

@property (nonatomic, readwrite) NSString *email;
@property (nonatomic, readwrite) NSMutableArray *timesheetArray;
@property (nonatomic, readwrite) NSMutableArray *companyArray;
@end
