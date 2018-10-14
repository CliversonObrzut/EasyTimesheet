//
//  DatabaseProvider.h
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 11/10/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UserModel.h"
@import Firebase;

@interface DatabaseProvider : NSObject

@property (nonatomic, readwrite) FIRFirestore *db;

//Methods
-(void)addNewUser:(NSString*)email;
-(FIRDocumentSnapshot*) getDocument:(NSString*)email;
-(void)setDocument:(NSString*)document ForCollection:(NSString*)collection WithDocData:(NSDictionary*)docData;
-(void) updateDocument:(NSString*)document ForCollection:(NSString*)collection WithDocData:(NSDictionary*)docData;

@end
