//
//  EventBuilder.h
//  BrowseMeetup
//
//  Created by Eric Chen on 4/24/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EventBuilder : NSObject
+ (NSArray *)eventsFromJSON:(NSData *)objectNotation error:(NSError **)error;
@end
