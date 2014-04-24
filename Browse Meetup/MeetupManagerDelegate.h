//
//  MeetupManagerDelegate.h
//  BrowseMeetup
//
//  Created by Eric Chen on 4/23/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MeetupManagerDelegate <NSObject>
- (void)didReceiveGroups:(NSArray *)groups;
- (void)fetchingGroupsFailedWithError:(NSError *)error;

- (void)didReceiveEvents:(NSArray *)events;
- (void)fetchingEventsFailedWithError:(NSError *)error;

@end
