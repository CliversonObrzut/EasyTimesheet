//
//  TimesheetTableViewController.m
//  EasyTimesheet
//
//  Created by Cliverson Obrzut on 21/9/18.
//  Copyright © 2018 Cliverson Obrzut. All rights reserved.
//

#import "TimesheetTableViewController.h"

@interface TimesheetTableViewController ()

@end

@implementation TimesheetTableViewController

@synthesize timesheetArray;

-(void)viewDidAppear:(BOOL)animated{
    @try{
        [super viewDidAppear:animated];
        timesheetArray = [[NSMutableArray alloc]init];
        
        [self handleTimesheetArray];
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

-(void) handleTimesheetArray {
    @try {
        TimesheetCell *timesheetOne = [[TimesheetCell alloc] init];
        [timesheetOne setCompany:@"AIT"];
        [timesheetOne setWorkedDate:@"13/10/18"];
        [timesheetOne setStartTime:@"08:00"];
        [timesheetOne setEndTime:@"16:15"];
        [timesheetOne setPayRate:@"$25.00"];
        [timesheetOne setAmount:@"$206.25"];
        
        [self.timesheetArray addObject:timesheetOne];
        
        TimesheetCell *timesheetTwo = [[TimesheetCell alloc] init];
        [timesheetTwo setCompany:@"AIT"];
        [timesheetTwo setWorkedDate:@"14/10/18"];
        [timesheetTwo setStartTime:@"09:00"];
        [timesheetTwo setEndTime:@"16:30"];
        [timesheetTwo setPayRate:@"$25.00"];
        [timesheetTwo setAmount:@"$187.50"];
        
        [self.timesheetArray addObject:timesheetTwo];
        
        TimesheetCell *timesheetThree = [[TimesheetCell alloc] init];
        [timesheetThree setCompany:@"AIT"];
        [timesheetThree setWorkedDate:@"15/10/18"];
        [timesheetThree setStartTime:@"07:00"];
        [timesheetThree setEndTime:@"16:00"];
        [timesheetThree setPayRate:@"$25.00"];
        [timesheetThree setAmount:@"$225.00"];
        
        [self.timesheetArray addObject:timesheetThree];
        
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
        return [timesheetArray count];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    @try{
        static NSString *cellIdentifier = @"timhesheetCell";
        
        [self.tableView registerNib:[UINib nibWithNibName:@"TimeSheetTableViewCell" bundle:nil] forCellReuseIdentifier:cellIdentifier];
        
        TimeSheetTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        
        //Details
        [[cell dateLabel] setText:[NSString stringWithFormat:@"Date: %@", [[timesheetArray objectAtIndex:indexPath.row] workedDate]]];
        [[cell startEndLabel] setText:[NSString stringWithFormat:@"Start: %@  End: %@", [[timesheetArray objectAtIndex:indexPath.row]startTime],[[timesheetArray objectAtIndex:indexPath.row]endTime]]];
        [[cell companyNameLabel] setText:[NSString stringWithFormat:@"Company: %@", [[timesheetArray objectAtIndex:indexPath.row] company]]];
        [[cell dayRateLabel] setText:[NSString stringWithFormat:@"Pay Rate: %@", [[timesheetArray objectAtIndex:indexPath.row] payRate]]];
        [[cell amountLabel] setText:[NSString stringWithFormat:@"%@", [[timesheetArray objectAtIndex:indexPath.row] amount]]];
        
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
        [self performSegueWithIdentifier:@"edit_timesheet_segue_identifier" sender:self];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    @try{
        TimesheetCell *timesheet = [[TimesheetCell alloc] init];
        
        if ([segue.identifier isEqualToString:@"edit_timesheet_segue_identifier"])
        {
            timesheet = [timesheetArray objectAtIndex:self.tableView.indexPathForSelectedRow.row];
            EditTimesheetViewController *viewController = segue.destinationViewController;
            [viewController setTimesheetSegue:timesheet];
        }
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}


- (IBAction)filterButton:(id)sender {
    @try{
        [self performSegueWithIdentifier:@"timesheet_filter_identifier_segue" sender:self];
    }
    @catch(NSException *ex){
        AlertsViewController *alertError = [[AlertsViewController alloc]init];
        [alertError displayAlertMessage: [NSString stringWithFormat:@"%@", [ex reason]]];
    }
}

@end
