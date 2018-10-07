//
//  ViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 18/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize db, handle;

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:<#animated#>];
    
    self.handle = [[FIRAuth auth] addAuthStateDidChangeListener:^(FIRAuth * _Nonnull auth, FIRUser * _Nullable user) {
        if(!user) {
            
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.db = [FIRFirestore firestore];
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)LoginButton:(id)sender {
    
}

- (IBAction)RegisterNavButton:(id)sender {
    
}
@end
