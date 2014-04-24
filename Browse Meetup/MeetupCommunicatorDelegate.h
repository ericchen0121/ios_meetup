//
//  MeetupCommunicatorDelegate.h
//  BrowseMeetup
//
//  Created by Eric Chen on 4/23/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol MeetupCommunicatorDelegate <NSObject>
- (void)receivedGroupsJSON:(NSData *)objectNotation;
- (void)fetchingGroupsFailedWithError:(NSError *)error;
@end
