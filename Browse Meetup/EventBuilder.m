//
//  EventBuilder.m
//  BrowseMeetup
//
//  Created by Eric Chen on 4/24/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import "EventBuilder.h"
#import "Event.h"

@implementation EventBuilder


+ (NSArray *)eventsFromJSON:(NSData *)objectNotation error:(NSError **)error
{
  NSError *localError = nil;
  NSDictionary *parsedObject = [NSJSONSerialization JSONObjectWithData:objectNotation options:0 error:&localError];
  
  if (localError != nil) {
    *error = localError;
    return nil;
  }
  
  NSMutableArray *events = [[NSMutableArray alloc] init];
  
  NSArray *results = [parsedObject valueForKey:@"results"];
  NSLog(@"Count of Returned Events %d", results.count);
  
  for (NSDictionary *eventDic in results) {
    Event *event = [[Event alloc] init];
    
    for (NSString *key in eventDic) {
      if ([event respondsToSelector:NSSelectorFromString(key)]) {
        [event setValue:[eventDic valueForKey:key] forKey:key];
      }
    }
    
    [events addObject:event];
  }
  
  return events;
}

@end