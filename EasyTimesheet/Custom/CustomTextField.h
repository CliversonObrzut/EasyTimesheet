//  Custom UITextField to add Icon
//  CustomTextField.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 08/10/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.

#import <UIKit/UIKit.h>

@interface CustomTextField : UIViewController

//Constants to use in this Class
extern NSString *const const_password_icon;
extern NSString *const const_email_icon;

-(void)setIcon:(NSString *)iconName forUITextField:(UITextField *)textField;

@end
