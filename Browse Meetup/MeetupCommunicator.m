//
//  MeetupCommunicator.m
//  BrowseMeetup
//  MeetupCommunicator opens up the connection to the Meetup API and searches by location coordinates to return groups
//
//  Created by Eric Chen on 4/23/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import "MeetupCommunicator.h"
#import "MeetupCommunicatorDelegate.h"

#define API_KEY @"64d364863306827347a1d8092f5414"
#define PAGE_COUNT 20

@implementation MeetupCommunicator

-(void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate
{
  NSString *urlAsString = [NSString stringWithFormat:@"https://api.meetup.com/2/groups?&sign=true&zip=94121&page=20&desc=false&offset=0&format=json&page=20&key=64d364863306827347a1d8092f5414"];
  //NSString *urlAsString = [NSString stringWithFormat:@"https://api.meetup.com/2/groups?lat=%f&lon=%f&page=%d&key=%@", coordinate.latitude, coordinate.longitude, PAGE_COUNT, API_KEY];
  NSURL *url = [[NSURL alloc] initWithString:urlAsString];
  NSLog(@"%@", urlAsString);
  
  [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error) {
    
    if (error){
      [self.delegate fetchingGroupsFailedWithError:error];
    } else {
      [self.delegate receivedGroupsJSON:data];
		}
  }];
}


-(void)searchEventsForGroup:(NSString *)groupName
{
  NSString *urlAsString = [NSString stringWithFormat:@"http://api.meetup.com/2/events?status=upcoming&order=time&limited_events=False&group_urlname=%@&desc=false&offset=0&format=json&page=%d&key=%@", groupName, PAGE_COUNT, API_KEY];
  NSURL *url = [[NSURL alloc] initWithString:urlAsString];
  NSLog(@"%@", urlAsString);
  
  [NSURLConnection sendAsynchronousRequest:[[NSURLRequest alloc] initWithURL:url] queue:[[NSOperationQueue alloc] init] completionHandler: ^(NSURLResponse *response, NSData *data, NSError *error) {
    
    if (error){
      [self.delegate fetchingEventsFailedWithError:error];
    } else {
      [self.delegate receivedEventsJSON:data];
		}
  }];
}

@end

