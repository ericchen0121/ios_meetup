//
//  MeetupCommunicator.h
//  BrowseMeetup
//
//  Created by Eric Chen on 4/23/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

@protocol MeetupCommunicatorDelegate;

@interface MeetupCommunicator : NSObject
@property(weak, nonatomic) id<MeetupCommunicatorDelegate> delegate;

-(void)searchGroupsAtCoordinate:(CLLocationCoordinate2D)coordinate;
-(void)searchEventsForGroup:(NSString *)groupName;
@end
