//
//  AgendaViewController.m
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/15/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import "AppDelegate.h"
#import "AgendaViewController.h"
#import "Contact.h"
#import "ContactCell.h"
#import "AgendaDetailViewController.h"
#import "AFNetworking/AFNetworking.h"

NSString *kContactAdded = @"kContactAdded";
NSString *kContactEdited = @"kContactEdited";

@interface AgendaViewController ()

@end

@implementation AgendaViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];

    _contacts = [[NSMutableArray alloc] init];
    Contact *bob = [[Contact alloc] init:@"Bob" withPhones:[NSMutableArray arrayWithObjects:@"5555 5555", @"6666 6666", @"7777 7777", nil]];
    [_contacts addObject:bob];
    
    [self refreshTableView:nil];
}

- (void) refreshTableView:(NSNotification *)notification
{
    [[AppDelegate sharedClient] getPath:@"/contact/" parameters:nil success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"contacts received");
        
        NSError *error = nil;
        if(error == nil)
            _contacts = [Contact contactsFromJson:[NSJSONSerialization JSONObjectWithData:responseObject options:0 error:&error]];
        
        NSLog(@"%@", _contacts);
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"contacts error");
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_contacts count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"ContactCell";
    ContactCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    cell.label.text = [_contacts[indexPath.row] name];
    
    return cell;
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([segue.identifier isEqualToString:@"view"]) {
        AgendaDetailViewController *ct = segue.destinationViewController;
        ct.contact = _contacts[self.tableView.indexPathForSelectedRow.row];
    }
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
