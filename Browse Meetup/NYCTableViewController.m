//
//  MasterViewController.m
//  Read JSON
//
//  Created by TAMIM Ziad on 8/16/13.
//  Copyright (c) 2013 TAMIM Ziad. All rights reserved.
//

#import "NYCTableViewController.h"

#import "DetailCell.h"
#import "Event.h"
#import "Group.h"
#import "MeetupManager.h"
#import "MeetupCommunicator.h"


@interface NYCTableViewController () <MeetupManagerDelegate> {
  NSArray *_groups;
  NSArray *_events_NYC;
  MeetupManager *_manager;
}
@property (weak, nonatomic) CLLocationManager *locationManager;
@end

@implementation NYCTableViewController

- (void)viewDidLoad
{
  [super viewDidLoad];
  _manager = [[MeetupManager alloc] init];
  _manager.communicator = [[MeetupCommunicator alloc] init];
  _manager.communicator.delegate = _manager;
  _manager.delegate = self;
  
  [_manager fetchEventsForGroup:@"DBCx-SF-Dev-Bootcamp-San-Francisco-Open-Learning"];
  
}

#pragma mark - MeetupManagerDelegate

- (void)didReceiveGroups:(NSArray *)groups
{
  _groups = groups;
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.tableView reloadData];
  });
}

- (void)fetchingGroupsFailedWithError:(NSError *)error
{
  NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

- (void)didReceiveEvents:(NSArray *)events
{
  _events_NYC = events;
  
  dispatch_async(dispatch_get_main_queue(), ^{
    [self.tableView reloadData];
  });
}

- (void)fetchingEventsFailedWithError:(NSError *)error
{
  NSLog(@"Error %@; %@", error, [error localizedDescription]);
}

#pragma mark - Table View

// For Groups
//- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
//{
//  return _groups.count;
//}
//
//- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//  DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
//
//  Group *group = _groups[indexPath.row];
//  [cell.nameLabel setText:group.name];
//  [cell.whoLabel setText:group.who];
//  [cell.locationLabel setText:[NSString stringWithFormat:@"%@, %@", group.city, group.country]];
//  [cell.descriptionLabel setText:group.description];
//
//  return cell;
//}

// For Events
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
  return _events_NYC.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
  DetailCell *cell = [tableView dequeueReusableCellWithIdentifier:@"NYCTableViewCell" forIndexPath:indexPath];
  
  Event *event_1 = _events_NYC[indexPath.row];
  [cell.nameLabel setText:event_1.name];
  
  return cell;
}
@end
