//
//  MeetupManager.m
//  BrowseMeetup
//
//  Created by Eric Chen on 4/23/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import "MeetupManager.h"
#import "GroupBuilder.h"
#import "MeetupCommunicator.h"

@implementation MeetupManager
- (void)fetchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
  [self.communicator searchGroupsAtCoordinate:coordinate];
}

- (void)fetchEventsForGroup:(NSString *)groupName
{
  [self.communicator searchEventsForGroup:groupName];
}

#pragma mark - MeetupCommunicatorDelegate

// For fetchGroupsAtCoordinate MeetupCommunicatorDelegate methods
- (void)receivedGroupsJSON:(NSData *)objectNotation
{
  NSError *error = nil;
  NSArray *groups = [GroupBuilder groupsFromJSON:objectNotation error:&error];
  
  if (error != nil) {
    [self.delegate fetchingGroupsFailedWithError:error];
    
  } else {
    [self.delegate didReceiveGroups:groups];
  }
}

- (void)fetchingGroupsFailedWithError:(NSError *)error
{
  [self.delegate fetchingGroupsFailedWithError:error];
}

// For fetchEventsForGroup MeetupCommunicatorDelegate methods
- (void)receivedEventsJSON:(NSData *)objectNotation
{
  NSError *error = nil;
  NSArray *events = [EventBuilder eventsFromJSON:objectNotation error:&error];
  
  if (error != nil) {
    [self.delegate fetchingEventsFailedWithError:error];
    
  } else {
    [self.delegate didReceiveEvents:events];
  }
}

- (void)fetchingEventsFailedWithError:(NSError *)error
{
  [self.delegate fetchingEventsFailedWithError:error];
}

@end
