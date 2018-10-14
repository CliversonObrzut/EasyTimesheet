//
//  DatabaseProvider.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 11/10/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "DatabaseProvider.h"

@implementation DatabaseProvider

@synthesize db;

// Class constants
NSString *const collection = @"Timesheets";

-(id) init {
    @try {
        self = [super init];
        if(self) {
            self.db = [FIRFirestore firestore];
            NSLog(@"Created new DB object");
        }
    }
    @catch(NSException *ex) {
        @throw ex.reason;
    }
}

/**
 *
 * Start a new user in database using email as document id
 * @author Cliverson Obrzut
 *
 */
-(void)addNewUser:(NSString*) email {
    UserModel *userModel = [[UserModel alloc] init];
    userModel.email = email;
    userModel.timesheetArray = [NSMutableArray new];
    userModel.companyArray = [NSMutableArray new];
    
    NSLog(@"add new user called: %@", userModel.email);
    
    NSDictionary *data = @{
        @"timesheets":userModel.timesheetArray,
        @"companies":userModel.companyArray
    };
    
    NSLog(@"Dictionary: %@", data);
    
    @try {
        [self setDocument:email ForCollection:collection WithDocData:data];
    }
    @catch(NSException * error) {
        NSLog(@"error adding new user! %@", error);
    }
}

/**
 *
 * Get Document from Database
 *
 */

-(FIRDocumentSnapshot*) getDocument: (NSString*) email {
    /*[[[self.db collectionWithPath:collection] documentWithPath:email] getDocumentWithCompletion:^(FIRDocumentSnapshot * _Nullable snapshot, NSError * _Nullable error) {
        if(snapshot.exists) {
            NSLog(@"Document retrieved!");
        }
        else {
            NSLog(@"Document does not exist");
        }
        return snapshot;
    }];*/
    return 0;
}

/**
 *
 * Insert a new document in a collection
 * @author Cliverson Obrzut
 *
 */
- (void) setDocument:(NSString*) document ForCollection: (NSString*) collection WithDocData: (NSDictionary*) docData {
    [[[self.db collectionWithPath:collection] documentWithPath:document] setData:docData completion:
     ^(NSError * _Nullable error) {
         if(error != nil) {
             NSLog(@"Error writing document: %@", error);
         }
         else {
             NSLog(@"Document successfully written!");
         }
     }];
}

/**
 *
 * Update a document in a collection
 * @author Cliverson Obrzut
 *
 */
- (void) updateDocument:(NSString*) document ForCollection: (NSString*) collection WithDocData: (NSDictionary*) docData {
    [[[self.db collectionWithPath:collection] documentWithPath:document] updateData:docData completion:
     ^(NSError * _Nullable error) {
         if(error != nil) {
             NSLog(@"Error updating document: %@", error);
         }
         else {
             NSLog(@"Document successfully updated!");
         }
     }];
}
@end
