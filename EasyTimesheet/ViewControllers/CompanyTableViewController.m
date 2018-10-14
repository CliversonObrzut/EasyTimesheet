//
//  CompanyTableViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "CompanyTableViewController.h"

@interface CompanyTableViewController ()

@end

@implementation CompanyTableViewController

@synthesize companyArray;

-(void)viewDidAppear:(BOOL)animated{
    @try{
        [super viewDidAppear:animated];
        companyArray = [[NSMutableArray alloc]init];
        
        [self handleCompanyArray];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

- (void)viewDidLoad {
    @try{
        [super viewDidLoad];
        
        self.tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        self.tableView.delegate = self;
        self.tableView.dataSource = self;
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) handleCompanyArray {
    @try {
        CompanyCell * companyOne = [[CompanyCell alloc] init];
        [companyOne setCompany:@"AIT"];
        [companyOne setStartDate:@"24/08/18"];
        [companyOne setPrMon:@"25.00"];
        [companyOne setPrTue:@"25.00"];
        [companyOne setPrWed:@"25.00"];
        [companyOne setPrThu:@"25.00"];
        [companyOne setPrFri:@"25.00"];
        [companyOne setPrSat:@"30.00"];
        [companyOne setPrSun:@"36.00"];
        
        [self.companyArray addObject:companyOne];
        
        CompanyCell * companyTwo = [[CompanyCell alloc] init];
        [companyTwo setCompany:@"UTS"];
        [companyTwo setStartDate:@"31/07/18"];
        [companyTwo setPrMon:@"28.00"];
        [companyTwo setPrTue:@"28.00"];
        [companyTwo setPrWed:@"28.00"];
        [companyTwo setPrThu:@"28.00"];
        [companyTwo setPrFri:@"28.00"];
        [companyTwo setPrSat:@"34.00"];
        [companyTwo setPrSun:@"42.00"];
        
        [self.companyArray addObject:companyTwo];
        
        CompanyCell * companyThree = [[CompanyCell alloc] init];
        [companyThree setCompany:@"TAFE"];
        [companyThree setStartDate:@"15/09/18"];
        [companyThree setPrMon:@"22.00"];
        [companyThree setPrTue:@"22.00"];
        [companyThree setPrWed:@"22.00"];
        [companyThree setPrThu:@"22.00"];
        [companyThree setPrFri:@"22.00"];
        [companyThree setPrSat:@"27.00"];
        [companyThree setPrSun:@"30.00"];
        
        [self.companyArray addObject:companyThree];
        
        [self.tableView reloadData];
    }
    @catch(NSException *error) {
        NSLog(@"Error loading timesheet data");
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    @try {
        return [companyArray count];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @try{
        static NSString *cellIdentifier = @"companyCell";
        
        [self.tableView registerNib:[UINib nibWithNibName:@"CompanyTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
        
        CompanyTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
        //Details
        [[cell companyNameLabel] setText:[NSString stringWithFormat:@"Company: %@", [[companyArray objectAtIndex:indexPath.row] company]]];
        
        //cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
        
        return cell;
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

//
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

/*
 // Override to support editing the table view.
 - (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
 if (editingStyle == UITableViewCellEditingStyleDelete) {
 // Delete the row from the data source
 [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
 } else if (editingStyle == UITableViewCellEditingStyleInsert) {
 // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
 }
 }
 */

/*
 // Override to support rearranging the table view.
 - (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
 }
 */

/*
 // Override to support conditional rearranging of the table view.
 - (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
 // Return NO if you do not want the item to be re-orderable.
 return YES;
 }
 */


#pragma mark - Navigation

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    @try{
        [self performSegueWithIdentifier:@"company_edit_segue_identifier" sender:self];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    @try{
        CompanyCell *company = [[CompanyCell alloc] init];
        
        if ([segue.identifier isEqualToString:@"company_edit_segue_identifier"])
        {
            company = [companyArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
            CompanyCRUDViewController *viewController = segue.destinationViewController;
            [viewController setCompanySegue:company];
        }
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

- (IBAction)addCompanyButton:(id)sender {
    @try{
        [self performSegueWithIdentifier:@"company_add_segue_identifier" sender:self];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}
@end
