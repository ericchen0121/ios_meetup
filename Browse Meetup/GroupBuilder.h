//
//  GroupBuilder.h
//  BrowseMeetup
//
//  Created by Eric Chen on 4/23/14.
//  Copyright (c) 2014 TAMIM Ziad. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GroupBuilder : NSObject
+ (NSArray *)groupsFromJSON:(NSData *)objectNotation error:(NSError **)error;
@end
