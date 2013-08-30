//
//  NewContactViewController.m
//  AgendaApp
//
//  Created by AdminMacLC04 on 8/22/13.
//  Copyright (c) 2013 AdminMacLC04. All rights reserved.
//

#import "AppDelegate.h"
#import "NewContactViewController.h"
#import "Phone.h"
#import "PhoneCell.h"

@interface NewContactViewController ()

@property (strong, nonatomic) NSMutableArray *phones;
@property (strong, nonatomic) Phone *tempPhone;

@end

@implementation NewContactViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	_phones = [[NSMutableArray alloc] init];
    _tempPhone = [[Phone alloc] init];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
}

- (IBAction)done:(id)sender {
    [self.presentingViewController dismissViewControllerAnimated:YES completion:NULL];
    
    NSMutableDictionary *contact = [[NSMutableDictionary alloc] init];
    [contact setObject:_nameTextField.text forKey:@"name"];
    
    NSMutableArray *phonesJson = [[NSMutableArray alloc] initWithCapacity:[_phones count]];
    for(Phone *phone in _phones){
        [phonesJson addObject:[phone json]];
    }
    [contact setObject:phonesJson forKey:@"phones"];
    
    NSError *error;
    NSData * data = [NSJSONSerialization dataWithJSONObject:phonesJson options:nil error:&error];
    NSString *jsonString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    
    [[AppDelegate sharedClient] postPath:@"/contact" parameters:@{@"contact": jsonString} success:^(AFHTTPRequestOperation *operation, id responseObject) {
        NSLog(@"post success");
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        NSLog(@"post error");
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return [_phones count] + 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *CellIdentifier = @"PhoneCell";
    PhoneCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    if (indexPath.row < [_phones count]) {
        [cell setPhone:_phones[indexPath.row]];
    }else{
        [cell setPhone:_tempPhone];
    }
    
    cell.ncvc = self;
     
    return cell;
}

- (void) phoneDidChange:(Phone *)phone
{
    if (phone == _tempPhone) {
        [_phones addObject:_tempPhone];
        _tempPhone = [[Phone alloc] init];
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:[_phones count] inSection:0];
        [_phonesTableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
    }
}

- (void) phoneFinishedEdit:(Phone *)phone
{
    if (_tempPhone != nil && _tempPhone.phone.length > 0) {
        [_phones addObject:_tempPhone];
        _tempPhone = [[Phone alloc] init];
    }
    
    NSMutableArray *deletePhones = [[NSMutableArray alloc] init];
    for (Phone *phone in _phones) {
        if (phone == nil || phone.phone.length == 0) {
            [deletePhones addObject:phone];
        }
    }
    
    NSMutableArray *deleteIndexes = [[NSMutableArray alloc] init];
    for (Phone *phone in deletePhones) {
        int idx = [_phones indexOfObject:phone];
        
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:idx inSection:0];
        [deleteIndexes addObject:indexPath];
    }
    
    for (Phone *phone in deletePhones) {
        [_phones removeObject:phone];
    }
    
    [_phonesTableView deleteRowsAtIndexPaths:deleteIndexes withRowAnimation:UITableViewRowAnimationFade];
}

@end
