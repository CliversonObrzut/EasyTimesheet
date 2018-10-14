//
//  Company.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 13/10/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Company : NSObject

@property NSString *name;
@property NSNumber *prMon;
@property NSNumber *prTue;
@property NSNumber *prWed;
@property NSNumber *prThu;
@property NSNumber *prFri;
@property NSNumber *prSat;
@property NSNumber *prSun;
@property NSDate *startDate;

@end
