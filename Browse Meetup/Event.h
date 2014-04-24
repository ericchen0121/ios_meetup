//
//  Event.h
//  BrowseMeetup
//
//  Created by Eric Chen on 4/24/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Event : NSObject
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSString *description;
@property (strong, nonatomic) NSString *event_url;
@property (strong, nonatomic) NSString *time;
//@property (strong, nonatomic) NSDictionary *venue;
//@property (strong, nonatomic) NSNumber *rsvp_limit
//@property (strong, nonatomic) NSNumber *yes_rsvp_count
//@property (strong, nonatomic) NSNumber *waitlist_count
//@property (strong, nonatomic) NSNumber *id
@end
